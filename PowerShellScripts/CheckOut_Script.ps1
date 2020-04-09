

#Using this as place holder for now
$FailureLog = "C:\BuildLogFolder\02_Checkout_Git lfs fetch failed with exit code_2.txt"

#This script will dedicate to identifing problems with the Checkout step of the build process.
$Solutions = @{}

Function Create-Solution-Dictionary
{
    #To add a new solution/recommend copy this approach and increment the index
    #The error text should be exactly what we would find in the log and serves as the entry point
    #We'll use the Inde value as the switch case for processing the solution
    $Solutions[1] = "##[error]Git lfs fetch failed with exit code: 2. Git lfs logs returned with exit code: 0."
}

Function Problem_1
{
    Write-Host "Processing Problem_1 Solution"
    $Solutions[1]
    
    ##[error]Git lfs fetch failed with exit code: 2. Git lfs logs returned with exit code: 0.
    #"Git lfs fetch" is the command which failed
    
    #Step 1: Find the "Git lfs fetch" command
    $GitlfsFetch_cmd = Get-Content $FailureLog | Select-String -SimpleMatch '##[command]git lfs fetch origin' | Select-Object -Last 1
    $GitlfsFetch_cmd -split " ",2 | Select-Object -Skip 1
    $GitlfsFetch = Get-Content $FailureLog | Select-String -SimpleMatch 'fetch: Fetching reference' | Select-Object -Last 1
    $GitlfsFetch -split " ",2 | Select-Object -Skip 1
    $BatchResponse = Get-Content $FailureLog | Select-String -SimpleMatch 'batch response:' | Select-Object -Last 1
    $BatchResponse -split " ",2 | Select-Object -Skip 1
    #Recommendations
    Write-Host "Please review the solution document https://github.com/tdevere/AppCenterBuildLog/blob/master/Checkout.md#errorgit-lfs-fetch-failed-with-exit-code-2-git-lfs-logs-returned-with-exit-code-0"

}

Create-Solution-Dictionary #Initial Setup work

#Does the File Exist?
if (Test-Path -Path $FailureLog)
{
    #RunSolutions holds the number of solutions found by error
    $RunSolutions = New-Object Collections.Generic.List[Int]
    #AllMessagesArray is a list of messages that COULD be part of a solution
    $AllMessagesArray = Get-Content $FailureLog | Select-String -AllMatches '##[^$]' 
    #Process each message, and pull out just the error    
    Foreach ($Message in $AllMessagesArray)
    {
        $errMessage = $Message -split " ",2 | Select-Object -Skip 1
        #Look up the Key value so we can process our response based on error 
        Foreach ($Key in ($Solutions.GetEnumerator() | Where-Object {$_.Value -eq $errMessage})) {$RunSolutions.Add($Key.Name)}
    }
}

#Now start solution checks
if ($RunSolutions.Count -gt 0)
{
    Foreach ($item in $RunSolutions)
    {   
        if ($item -eq 1)
        {
            Problem_1
        }
    }
}

