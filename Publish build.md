Publish build
--

## ``` ##[error]Publishing build artifacts failed with an error: Not found PathtoPublish: /Users/runner/runners/2.165.2/work/1/a/build ```
---

* [PathtoPublish](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/publish-build-artifacts?view=azure-devops) is The folder or file path to publish. This can be a fully-qualified path or a path relative to the root of the repository.
* Not found indicates an incorrect path was used in your publish script


#### Recommendations
---

* Review publish script for your project
* Ensure you use the correct path to artificates
* Checkout App Center [Environment variables](https://docs.microsoft.com/en-us/appcenter/build/custom/variables/)

####  Common Problems
---

| Error/Warning/Messages     | Advice     |
| ------------- |:-------------:
| Add here | something here


