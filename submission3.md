# Lab 3

## Task 1

Using `git cat-file -p <commit_hash>`

```bash
> git cat-file -p 7e1e255    
tree 50353062f0a4c197f98520847b74482525b8e077
parent 6ade7fdfa1fe2192c8f3e247ed8b24d5d7ff6b30
author Dmitriy Creed <creed@soramitsu.co.jp> 1725555553 +0300
committer Dmitriy Creed <creed@soramitsu.co.jp> 1725555553 +0300

Upload lab3 Version Control & lab4 Software Distribution

Signed-off-by: Dmitriy Creed <creed@soramitsu.co.jp>
```

Using `git cat-file -p <tree_hash>`

```bash
> git cat-file -p 50353062f0a4c197f98520847b74482525b8e077
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 1dba99957c3bb59d40913294b83e40d5c38b6c0b    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
```

Using `git cat-file -p <blob_hash>`

```bash
>git cat-file -p 2f8463cc188ec6ca69ae7a0f98d38e132280becb
# Version Control

In this lab, you will learn about version control systems and their importance in collaborative software development. You will specifically focus on Git, one of the most widely used version control systems. Follow the tasks below to complete the lab assignment.

## Task 1: Understanding Version Control Systems

**Objective**: Understand how Git stores data.

1. **Create and Explore a Repository**:
   - Use the current repository and make a few commits.
   - Use `git cat-file` to inspect the contents of blobs, trees, and commits.

     ```sh
     # Example commands to inspect contents
     git cat-file -p <blob_hash>
     git cat-file -p <tree_hash>
     git cat-file -p <commit_hash>
     ```

   - Create a `submission3.md` file.
   - Provide the output in the `submission3.md` file.

## Task 2: Practice with Git Reset Command

**Objective**: Practice using different ways to use the `git reset` command.

1. **Create a New Branch**:
   - Create a new branch named "git-reset-practice" in your Git repository.

     ```sh
     git checkout -b git-reset-practice
     ```

2. **Explore Advanced Reset and Reflog Usage**:
   - Create a series of commits.

     ```sh
     echo "First commit" > file.txt
     git add file.txt
     git commit -m "First commit"

     echo "Second commit" >> file.txt
     git add file.txt
     git commit -m "Second commit"

     echo "Third commit" >> file.txt
     git add file.txt
     git commit -m "Third commit"
     ```

   - Use `git reset --hard` and `git reset --soft` to navigate the commit history.

     ```sh
     git reset --soft HEAD~1
     git reset --hard HEAD~1
     ```

   - Use `git reflog` to recover commits after a reset.

     ```sh
     git reflog
     git reset --hard <reflog_hash>
     ```

3. **Documentation**:
   - Document the steps taken and push the final state to GitHub.
   - Document your practice in the `submission3.md` file and include the following details:
     - Steps you took to perform the Git reset operations.
     - Explain the reset and reflog process in the `submission3.md`.
     - Examples and outputs of the commands executed.

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [Pro Git Book](https://git-scm.com/book/en/v2)

### Guidelines

- Use proper Markdown formatting for documentation files.
- Organize files with appropriate naming conventions.
- Create a Pull Request to the main branch of the repository with your completed lab assignment.

> Note: Actively explore and document your findings to gain hands-on experience with Git.
```

## Task 2

```bash
> git checkout -b git-reset-practice 
Switched to a new branch 'git-reset-practice'

> echo "First Commit" > file.txt
> git add .\file.txt
> git commit -m "First Commit"
[git-reset-practice 6c1d347] First Commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file.txt
 
> echo "Second commit" >> file.txt 
> git add .\file.txt     
> git commit -m "Second commit"
[git-reset-practice 2500681] Second commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 
> echo "Third commit" >> file.txt
> git add .\file.txt
> git commit -m "Third commit"
[git-reset-practice d5b3b8b] Third commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 

#Completely removes all changes in the last commit, reverting the project to an earlier state.
> git reset --hard Head~1
HEAD is now at 2500681 Second commit

#This command moves the HEAD back by one commit, leaving both the index (staging area) and the working directory untouched. The changes from the most recent commit are still staged
> git reset --soft Head~1

> git reflog
6c1d347 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to Head~1
2500681 HEAD@{1}: reset: moving to Head~1
d5b3b8b HEAD@{2}: reset: moving to HEAD
d5b3b8b HEAD@{3}: commit: Third commit
2500681 HEAD@{4}: commit: Second commit
6c1d347 (HEAD -> git-reset-practice) HEAD@{5}: commit: First Commit
bf1e711 (origin/master, origin/HEAD, master) HEAD@{6}: checkout: moving from master to git-reset-practice
bf1e711 (origin/master, origin/HEAD, master) HEAD@{7}: clone: from https://github.com/reterman/F24-intro-labs.git

> git reset --hard d5b3b8b
HEAD is now at d5b3b8b Third commit
```

### Reset & Reflog

`git reset` allows you to undo changes in the repository by a specified number of commits back. It can be useful for reverting erroneous changes or squashing some commits before pushing.

`git reflog` is used to view the history of changes in HEAD. It is useful for recovering lost commits after a reset, as `git reflog` maintains a history of even deleted commits.

Example is above