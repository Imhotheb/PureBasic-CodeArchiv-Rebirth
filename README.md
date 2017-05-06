# Workflow of PureBasic-CodeArchiv-Rebirth

## Rules of commits
* Always use as the first word of the commit message: Fix, Add, Update, Remove, Change
* Commit message must not exceed one line
* Commit message must not exceed 50 characters
* Commit message must describe the change (only "Update", "Fix" etc. is not helpful to recognize
  what the commit is doing)
* If it is necessary to describe the change better:
  * Separate the normal message and the description with a blank line
  * Each line of the description must not exceed 76 characters
  * Describe why the change was made (what was changed can be seen via git diff)
  * Be critical and record it if the changes still require improvements, or errors in other code
    areas could occur through these changes

## Steps to add new codes
* One file codes:
  * To format the code correctly, use the "code_formatting_helper" from the "repo-dev" branch
  * Insert the supported OS on the end of the file name, like this: CodeName[Win,Lin,Mac].pb
  * If the code supports all OS, ignore the step above
  * If the code file contains only functions (include file) and does not execute any problematic
    code that is outside of "CompilerIf #PB_Compiler_IsMainFile", the file extension of the code
    file must be "pbi", otherwise "pb"
* More files codes:
  * Unpack ZIP-packed codes and create a new directory for them
  * Insert the supported OS on the end of the directory name, like this: CodeName[Win,Lin,Mac]
  * If the code supports all OS, ignore the step above
  * Instead of inserting a header into the code files, create a new text file named "CodeInfo.txt"
    and insert it into the new directory. Please be sure to use the "CodeInfo.txt" file from the
    "repo-dev" branch and be careful not to delete the contained blanks and only write one-line
* Use the "CodesCleaner" from the "repo-dev" branch to automatically remove unimportant or
  disruptive content from the codes
* Use the "CodesChecker" from the "repo-dev" branch to automatically check the code files for
  errors
* Commit the new code:
  * If the code works correctly:
    * Commit directly into the "next" branch
  * If the code is not working correctly:
    * Create a new branch from the top of the "master" branch, name this new branch
      "pu/NameOfTheNewCode" and create the commit in this branch
    * Fixes are performed in this branch until the code is error-free and the branch can be merged
      into the "next" branch.
    * Please use the parameter "--no-ff" (no fast-forward) when you merge the "pu" branch to the
      "next" branch so that a merge commit is enforced. So it is better to see which commit
      belongs to which main change. It is then also easier to completely remove the code later, if
      necessary.

## Steps to check if there are updated codes in the forums
* Use the "Forum-Codes-Updates-Checker" from the "repo-dev" branch to automatically check if there
  are updated codes in the forums. The PB tool uses the forums urls from the code headers. With
  each scan, the state of the forums is stored in the "Cache" directory. So if there are no
  changes in the forums between two programstarts, the program does not show any changes.
* Look at the output file

## Steps to bring the "master" branch to a new stable version
* Use the "CodesChecker" from the "repo-dev" branch to check the current state of the "next"
  branch with the latest PureBasic version and under all operating systems (Windows, Linux, MacOS)
  for errors
  * If no errors are reported, the "next" branch can be merged into the "master" branch
  * If there are still errors, they are still to be fixed in the "next" branch
