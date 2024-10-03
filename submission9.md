
## Task 1: Creating Your First GitHub Actions Pipeline

### Key Concepts
- GitHub Actions workflows are triggered by events such as `push` and `workflow_dispatch`.
- Workflow files must be located in the `.github/workflows` directory.
- `jobs.build.runs-on` defines the operating system that will be used to execute the job.

### Steps Followed
1. **Creating the Workflow File**:  
   I created a file named `github-actions-demo.yml` inside the `.github/workflows/` directory.

   The file content was as follows:

   ```yaml
   name: GitHub Actions Demo
   run-name: ${{ github.actor }} is testing out GitHub Actions 🚀

   on: [push]

   jobs:
     Explore-GitHub-Actions:
       runs-on: ubuntu-latest

       steps:
         - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
         - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
         - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
         - name: Check out repository code
           uses: actions/checkout@v4
         - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
         - run: echo "🖥️ The workflow is now ready to test your code on the runner."
         - name: List files in the repository
           run: |
             ls ${{ github.workspace }}
         - run: echo "🍏 This job's status is ${{ job.status }}."
   ```

2. **Commit Changes**:  
   I committed the changes, which triggered the `push` event and initiated the workflow.

3. **Observing Workflow Execution**:  
   In the **Actions** tab of the GitHub repository, I could see the workflow `GitHub Actions Demo` being executed. The logs for each step were visible:
   - A message confirming the workflow was triggered by a push event.
   - Information about the runner's operating system.
   - The branch and repository details.
   - The repository code was checked out.
   - The list of files in the repository was displayed.
   - The final job status was shown.

### Observations
- The workflow was executed successfully with no errors.
- The output of the command `ls` listed the files in the repository.
- The job status was successfully displayed at the end of the execution.

---

## Task 2: Manual Triggering and System Information Gathering

### Manual Triggering
- I modified the workflow file to support manual execution by adding the `workflow_dispatch` event:

   ```yaml
   on: [push, workflow_dispatch]
   ```

- This allowed me to manually trigger the workflow through the GitHub Actions interface by clicking the **Run workflow** button.

### System Information Gathering
- I added a step to gather system information about the runner, including the operating system, CPU, and memory details:

   ```yaml
   - name: Gather system information
     run: |
       echo "Operating System: $(uname -a)"
       echo "CPU Information:"
       lscpu
       echo "Memory Information:"
       free -h
   ```

- The system information was successfully gathered and included details about the operating system version, CPU architecture, and available memory on the runner.

### Observations
- The manual trigger was successfully executed using the **Run workflow** button.
- The system information gathering step provided the following output:

   ```
   Operating System: (Output of `uname -a`)
   CPU Information: (Output of `lscpu`)
   Memory Information: (Output of `free -h`)
   ```
