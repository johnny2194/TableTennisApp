Create a PGSQL database: `createdb table_tennis`

Add tables to the database from models file: `psql -d table_tennis -f table_tennis.sql`

Run seeds: `ruby seeds.rb`


Create branch:
`git checkout -b NEW_BRANCH_NAME`

Switch to branch:
`git checkout BRANCH_NAME`

Add your local branch as a branch on remote repo:
 1. `git add .`
 2. `git commit [your message]`
 3. You will see an error, something like:
 ```
 fatal: The current branch BRANCH_NAME has no upstream branch.
 To push the current branch and set the remote as upstream, use

     git push --set-upstream origin BRANCH_NAME
     ```
 4. execute the `git push --set-upstream origin BRANCH_NAME`. your branch should now be visible on github. 

To checkout a remote branch:

1.  `git fetch`
2.  Get the list of remote branches: `git branch -r`
3.  Get the required branch: `git checkout NAME_OF_BRANCH`

gems required:
`check if you have gems: gem list`
`pg`, `pry`, `sinatra-contrib`, `sinatra`
