 $errormsg = "##[error]Publishing build artifacts failed with an error: Not found PathtoPublish"
 $location = "Publish build"

 $newStr = $location + $errormsg
 $finalStr =  $newStr -replace '\W','_' 
 $finalStr += ".md"
 $finalStr