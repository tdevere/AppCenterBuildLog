Build Step: yarn npm install
-

## ``` ##[error]/bin/sh failed with return code: 1 ```

## ``` ##[error]/bin/sh failed with error: /bin/sh failed with return code: 1 ```
---

* This error indicates a failure in the bash script
* Further analysis of the script is necessary to isolate the problem
* Often the return code may be used to narrow down exactly what to examine 

#### Recommendations
---

* Review the yarn npm install log
* Find the ##[error]/bin/sh failed with return code: 1
* Moving up from that spot notes of Warning, Errors, Failures


####  Common Problems
---
1. error An unexpected error occurred: "https://registry.yarnpkg.com/****: ESOCKETTIMEDOUT" 
    * either the build machine is having network problems or the endpoint hosting the package is having network problems. You can test by running the scrpit locally to determine which is the case. If the build machine does have the network issue, you can report it to App Center team but the problem may resolve itself as well
    * Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO


####  Undocumented Problem
---
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/AppCenterBuildLog/ContactingAppCenterSupport.html)
