Build Step: Create distribution
--

## ``` ##[error]{"code":"bad_request","message":"Error: Distribution Store with id 11111111-2222-1111-2222-aaaaaaaaaaaa does not exist."} ```
---

* The Distribution store ID will be a GUID that was configured during the Build 
* The GUID will be unique to your App Center account or organization
* As indicated, the error indciated the ID didn't exist. 
* You may also see the following statement after this error in the build log ` http response code: 400 `
* The App Center portal does not show the IDs for Stores as it does for Distribution Groups.


#### Recommendations
---

* Query the [App Center API](https://openapi.appcenter.ms/#/distribute/stores_list) to find a list of the registered Store GUID's
* Make sure you use a valid GUID in your build configuration or distribution scripts


####  Common Problems
---
1. Store settings were removed and reconnected after the build was configured
    * Open build settings in App Center and reselect the correct store destination
    * Save your build configuration again

Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO



####  Undocumented Problem
---
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/AppCenterBuildLog/ContactingAppCenterSupport.html)
