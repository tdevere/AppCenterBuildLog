# Welcome to the VS App Center Build Log Wiki

## Introduction

VS App Center Support is exploring better ways to help customers identify and resolve Build Failures. Contributions are welcome. Please follow this form when making recommendations for content:

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
* Use this section to identify exact error to solution mapping

| Error/Warning/Messages     | Advice     |
| ------------- |:-------------:
| If we have exact messages add them | add solutions to those problems here

```

For an example document, take a look at the document  yarn_npm_install___error__bin_sh_failed_with_return_code__1.md


Future Plans include developing a PowerShell script which can be used to analyze build logs for known problems based on the knowledge generated from this Wiki. Essentially, if we can identify a problem and solution from build, we'll work to develop a script it do that work. 