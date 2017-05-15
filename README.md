Create a PGSQL database: `createdb table_tennis`

Add tables to the database from models file: `psql -d table_tennis -f table_tennis.sql`

Run seeds: `ruby seeds.rb`

Switch to branch:
`git checkout BRANCH_NAME`

To checkout a remote branch:

1.  `git fetch`
2.  Get the list of remote branches: `git branch -r`
3.  Get the required branch: `git checkout NAME_OF_BRANCH`

gems required:
`check if you have gems: gem list`
`pg`, `pry`
