Checkout
-

## ``` ##[error]Git lfs fetch failed with exit code: 2. Git lfs logs returned with exit code: 0. ```
---

* Git Large File Storage (Git LFS) is an open source extension to Git that allows you to work with large files the same way as other text files.
* [Reference: managing-large-files/versioning-large-file](https://help.github.com/en/github/managing-large-files/versioning-large-files)
* The error indicates you need to review the Checkout build steps and look for a line containing `##[command]git lfs fetch origin` the relevant sections to review will come after this command leading to the failure reported above. 

#### Recommendations
---

* Review the Checkout build log
* Find the ##[error]Git lfs failed
* Moving up look for the following text ##[command]git lfs fetch origin
* Review each line and make notes of Warning, Errors, Failures


####  Common Problems
---
1. This repository is over its data quota
    * Please follow up with with LFS provider. For example, if the repro is on GitHub, follow up here: [managing-billing-for-git-large-file-storage](https://help.github.com/en/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-git-large-file-storage) 
    * Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO


####  Undocumented Problem
---
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/AppCenterBuildLog/ContactingAppCenterSupport.html)

