Clear-Host
#This script will Order the build logs and determine which log the failure occurred

$bContinue = $true

#WikiDir is the path to local github repro storing the wiki markdown pages
$WikiDir = "C:\Users\Tony\source\repos\tdevere\AppCenterBuildLogWiki.wiki\"

#buildLogDirectory is the location of the folder containing the seperated build logs
$buildLogDirectory = "C:\BuildLogFolder\logs_3792\Build"

#buildLogs is the collection of files found within that log
$buildLogs = Get-ChildItem $buildLogDirectory -Filter *.txt 

if ($buildLogs.Count -le 1)
{
    $bContinue = $false #Set to false if there are no files to process
}

if ($bContinue)
{
    #Renaming the files if they are not in order to make sequential processing easy 
    foreach ($filename in $buildLogs)
    {              
        $Order = $filename.Name.ToCharArray() | Select-Object -First 2
            
        if ($Order.Item(1) -eq "_")
        {
            Write-Host "Rename This One " $filename.Name
            $NewName = "0" + $filename.Name
            Rename-Item -Path $filename -NewName $NewName
        }
    }

    #OrderedBuildLogs occurs after the rename to have properly sorted list
    $OrderedBuildLogs = Get-ChildItem $buildLogDirectory -Filter *.txt
    
    #LogOrderQueue using a queue to have a sorted int to compare
    $LogOrderQueue = New-Object System.Collections.Queue
        
    For ($i=1; $i -le $OrderedBuildLogs.Count; $i++) 
    {
        if ($i -le 9)
        {
            $LogOrderQueue.Enqueue("0"+$i)
        }
        else
        {
            $LogOrderQueue.Enqueue($i)
        }
    }

    #if there is a failure in the build, this will be the log that contains the failure
    $FailureLog = ""

    #local counter variable 
    $OrderLogCounter = 0

    foreach ($filename in $OrderedBuildLogs)
    {
        $ActualOrder = $filename.Name.Substring(0,2)
        $CorrectNextOrder = $LogOrderQueue.Dequeue()

        if ($ActualOrder -ne $CorrectNextOrder)
        {
            #Write-Host "Actual Order: " $ActualOrder "Correct Order: " $CorrectNextOrder
            Write-Host "Failure: " $OrderedBuildLogs[$OrderLogCounter-1]  
            $FailureLog = $OrderedBuildLogs[$OrderLogCounter-1]      
            break #Once we find the correct log to examine break
        }    
        $OrderLogCounter++
    }
}

#If we haev a failure - let's process it
if (Test-Path -Path $FailureLog)
{
    write-host "Processing Failure Log"
    $Section = Get-Content $FailureLog | Select-Object -First 1
    $SectionArray = $Section -split " ",2 | Select-Object -Skip 1 #used to remove the timestamp in logfile 
    $SectionArray #This is the section header of the build log 
    $ErrorsArray = Get-Content $FailureLog | Select-String -SimpleMatch '##[error]' #Load up each line reporting to be an Error
    $Errors = ""
    
    Foreach ($item in $ErrorsArray)
    {
        $Errors += $item -split " ",2 | Select-Object -Skip 1 #used to remove the timestamp in logfile 
        $Errors += [System.Environment]::NewLine
    }

    $Errors #This is a list of errors we collected

    if ($Errors.Length -le 1)
    {
        $bContinue = $false #Set to false if there are no errors to process
    }

    if ($bContinue)
    {
        #SectionFileName is the variable which represents the Markdown Wiki .MD file to store related errors
        $SectionFileName = $SectionArray -split ": ",2 | Select-Object -Skip 1 #used to remove the timestamp in logfile 
        $SectionFileName += ".md"
        #$SectionFileName

        #SectionFile is the full path to the markdown file
        $SectionFile = $WikiDir + $SectionFileName

        #Check to see if the SectionFile exists
        $SectionFileExists = Test-Path -Path $SectionFile
        
        $mdLine = "`````` "
        $mdLineEnd = " ``````"

        if (!$SectionFileExists)
        {       
            #if the SectionFile does not exist, then create one
            $SectionFileName = $SectionArray -split ": ",2 | Select-Object -Skip 1
            New-Item $SectionFile -ItemType File -Value ($SectionFileName + [System.Environment]::NewLine)
            Add-Content $SectionFile "--"

            Foreach ($item in $ErrorsArray)
            {
                $newItem = $item -split " ",2 | Select-Object -Skip 1 #used to remove the timestamp in logfile 
                
                Add-Content $SectionFile ([System.Environment]::NewLine)
                #add each error to the newly created SectionFile

                Add-Content $SectionFile ($mdLine + $newItem + $mdLineEnd)  
            }
        }
        else
        {    
            #the SectionFile did exist
            Foreach ($item in $ErrorsArray)
            {            
                $TempString = $item -split " ",2 | Select-Object -Skip 1 #used to remove the timestamp in logfile           
                $DoesEntryExist = Get-Content $SectionFile | Select-String -SimpleMatch $TempString
                #check to see if the error is already contained within the file

                if (!$DoesEntryExist)
                {
                    Add-Content $SectionFile ([System.Environment]::NewLine)
                    #if not, Add the error to the file                    
                    Add-Content $SectionFile ($mdLine + $TempString + $mdLineEnd)                     
                }
            }
        }
    }    
}
else
{
    #We didn't see a failure; should we look for all errors now? tdevere: I'm not sure if this is a good move; I want to get it
    #but perhaps it's not needed? I don't know; Also, what if the failure is not predictiable this way; I might need to ask more about this condition
    #if we're running this build analyzer and the build success - what is the right behavior? if it's false positive, I need to see about those
    #conditions
    
    # Collect All Log Elements
    # foreach ($filename in $OrderedBuildLogs)
    # {
    #     #Select all strings that match the ##[seciont] or command, or error, warning etc... 
    #     Get-Content $filename.FullName | Select-String -AllMatches '##[^$]' | Format-Table -AutoSize
    # }

}



