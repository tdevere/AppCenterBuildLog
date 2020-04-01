# Welcome to the VS App Center BuildLog Wiki

## Introduction

VS App Center Support is exploring better ways to help customers identify and resolve Build Failures. This repro contains a PowerShell script we are developing to help first identify common build issues and then automatically create content on those problems with guidance recommendations you can take to help resolve. Ideally, this knowledge can grow over time and be community driven.  

Overview of the PowerShell Script

1. Generate Failed Build Logs
2. Run the script against the build logs
3. We organize the logs and look for the failure section
4. We determine if a home page has been created for the Section and create one if needed
5. We add a list of errors to the Section if needed

TO DO: 
1. Create content on steps to troubleshoot those errors
2. Determine/Develop more sophisticated approaches to problems from log analysis
3. Add these to a "rules engine" to generate more useful analysis 

