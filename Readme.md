# Welcome to the VS App Center Build Log Wiki

## Introduction

VS App Center Support is exploring better ways to help customers identify and resolve Build Failures. Contributions are welcome. Please follow this form when making content submissions:

```
Build Step: (example here might be checkout)
--

## ``` ##[error]Please use the exact error message from build log here. ```
---

* Add meaningful context information 
* and describe the problem


#### Recommendations
---

* Add recommended troubleshootings steps
* These should help isolate the problem

####  Common Problems
---
1. Use this section to identify exact error to solution mapping
* Error/Warning/Messages
* Solutions
* * Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO/YES

```

For an example document, take a look at the document  [yarn_npm_install___error__bin_sh_failed_with_return_code__1.md](https://github.com/tdevere/AppCenterBuildLog/blob/master/yarn_npm_install___error__bin_sh_failed_with_return_code__1.md)

Please note that we are including a PowerShell script [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1) which can be used to analyze build logs for known problems based on the knowledge generated from this Wiki. Essentially, if we can identify a problem and solution from build logs alone, we'll work to develop a script it do that work. In the future, it might become customary to start with a build log review from this script to determine if you have a known issue before having to crack open the logs and manually searching for information. We'll see how that works out.


## How To Use the [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1)
---

* This section needs more work - coming soon.


##  Contributions
---

### New or Updating Existing Content
1. Fork the main repository
2. Create a new mark down page. 
3. File Name Format of the page is (BuildStage_Exact_Error).md
3. Example: yarn_npm_install___error__bin_sh_failed_with_return_code__1.md
4. Use the [Template in Introduction section](https://github.com/tdevere/AppCenterBuildLog#introduction) above
5. When the changes are complete, create a pull request
6. Once out of review, the changes will be merged

