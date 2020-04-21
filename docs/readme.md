## Introduction

VS App Center Support is exploring better ways to help customers identify and resolve Build Failures. [See the completed index of build failures here](/AppCenterBuildLog/content.html) Contributions are welcome. Please follow this form when making content submissions:

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
    * Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO/YES

####  Undocumented Problem
---
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/AppCenterBuildLog/ContactingAppCenterSupport.html)


```

For actual examples see [here](/AppCenterBuildLog/yarn_npm_install___error__bin_sh_failed_with_return_code__1.html) and [here](/AppCenterBuildLog/Checkout___error_Git_lfs_fetch_failed_with_exit_code__2__Git_lfs_logs_returned_with_exit_code__0_.html)

### Contribution Steps
1. Fork the [main repository](https://github.com/tdevere/AppCenterBuildLog)
2. Create a new mark down page under the /docs subfolder
3. Use the file Name Format BuildStage_Exact_Error.md
    * Example: yarn_npm_install___error__bin_sh_failed_with_return_code__1.md
4. Use the Template found this document to structure the document
5. When your changes are ready to be shared, create a pull request
6. Once out of review, the changes will be merged if approved