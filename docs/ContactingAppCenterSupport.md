## Important information when contact VS App Center Support

### Verify Build Works Locally with a Clean Repo

If the build succeeds on your local Windows or Mac computer but not on App Center, then it is usually because of uncommitted files, tooling or dependency differentiation.

Please perform a full git clone of your project into a new folder, this rules out dependencies which are cached locally. Then compile with the same configuration as App Center. This will ideally eliminate the most common root cause of these failures and expedite resolution.

1. Open your terminal or command line prompt then type in: mkdir appcenterTest
2. Then change directories: cd appcenterTest
3. Clone your repository with: git clone -b your-branch https://your-repo 
4. Then run the same build commands that we are using in App Center. You can build with command line or open the project file in your IDE
5. If the local build is successful, please collec the local build logs and be prepared to send to App Center Support Team

Review [build-failed](https://docs.microsoft.com/en-us/appcenter/build/troubleshooting/build-failed) for more insights into common builds.

### Contacting App Center Support

If you are unable to resolve the build failure following these guides, please help App Center support quickly investigate your build failure by sharing the following information when opening a support ticket at https://appcenter.ms.

1. Share the local build logs from the step 5 mentioned above.
2. Provide the full App Center URL to the failed build.
3. Answer
    * Did build ever work before? 
    * When did the issue start to happen? 
    * Have you changed anything maybe related before the issue happened?
    * If you revert changes does build succeed?
    * If we requier, may we run a debub build of your app?
