Build Step: XCode build (signed)
-
Build Step: XCode build (not signed)
-

## ``` ##[error]Error: /usr/bin/xcodebuild failed with return code: 65 ```
---

* xcodebuild [return code 65](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/sysexits.3.html) indicates `The input data was incorrect in some way. This should only be used for user's data and not system files. `
* In this context, there is not enough information to resolve the issue on the error alone. Further analysis on the log files is needed

#### Recommendations
---

* Review the Build Step logs for XCode build (signed/not signed)
* Looking for errors, warning, and other issues that standout
* If this project built before, make sure to examine the previous successful build for differences which may shed light on the situation

#### Common Problems
---
1. If the Xcode build step includes line(s) with the following details
    * ` error: /Users/runner/runners` 
        * and on the same line has these two statements 
            * ` unable to open file `
            * ` in project "Pods" ` 
    * Then you are likely in one of these situations
    1. Your repro has a /Pods/ folder AND that repro does not contain the project that was unable to be opened.        
        * You should either commit the missing project to the /Pods/ folder in the repro OR
        * Delete the /Pods/ folder in the repro
    * To confirm you are hitting this problem you can check the build step Initialize job and look to see if there is a task downloaded like this ` 2020-04-04T18:25:30.0905810Z Downloading task: CocoaPods (0.151.1) `
        * If there is no recorded task, App Center skipped it because it exists in the referenced repro already. This behavior is documented [here](https://docs.microsoft.com/en-us/appcenter/build/ios/first-build#38-cocoapods)
    2. There was an earlier failure downloading the referenced project
        * This would then most likey be caught on the build step ` Pod install `
        * Check this build log for more details regarding the referenced project in the `error:` referenced above

    

* Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO

####  Undocumented Problem
---
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/AppCenterBuildLog/ContactingAppCenterSupport.html)


