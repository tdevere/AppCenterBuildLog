Build Step: Publish build artifacts
-
Build Step: Publish symbols artifacts
-

## ``` ##[error]Publishing build artifacts failed with an error: Not found PathtoPublish: /Some/Path/Here ```
---

* [PathtoPublish](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/publish-build-artifacts?view=azure-devops) is The folder or file path to publish. This can be a fully-qualified path or a path relative to the root of the repository.
* Not found indicates an incorrect path was used in your publish script
* Take note of the specific path in the error to use to track where it was obtained in the script

#### Recommendations
---

* Review publish script for your project
* Ensure you use the correct path to artificates
* Checkout App Center [Environment variables](https://docs.microsoft.com/en-us/appcenter/build/custom/variables/)


####  Common Problems
---
1. If you meet the following conditions
    * You are building a UWP App
    * The faiulre occurs on Publish symbols artifacts build step
    * The failure text says ``` ##[error]Publishing build artifacts failed with an error: Not found PathtoPublish: d:\a\1\a\Symbols ```
        * Explanation - The symbols directory is missing. We need to add a step in post-clone to create that directory. Then during build process, the symbols will be avaiable later for the Publish Step.
        * Solution Steps
            1. Add the appcenter-post-clone.ps1 script next to your solution/project file to create an empty Scripts  folder with the following content:
                * mkdir $env:BUILD_ARTIFACTSTAGINGDIRECTORY\Symbols
            2. Push to repo, open App Center branch configuration and validate Post-clone script appears in More options within Build configuration.
            3. Save & Build your branch configuration.


#### Included in [BuildLogAnalyzer.ps1](https://github.com/tdevere/AppCenterBuildLog/blob/master/PowerShellScripts/BuildLogAnalyzer.ps1): NO


####  Undocumented Problem
---
If your problem was not documented and you require further support, please see [Contact App Center Support for Build Failure](/AppCenterBuildLog/ContactingAppCenterSupport.html)
