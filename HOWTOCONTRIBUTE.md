Create a PGSQL database: `createdb table_tennis`

Add tables to the database from models file: `psql -d table_tennis -f db/table_tennis.sql`

Run seeds: `db/ruby seeds.rb`

## Submitting a pull request

1. Clone the repo.
2. Make sure you are synced with the latest changes.
    `git fetch`
3. Make sure you have the new changes in your local development brach.
    `git merge origin/development`
4. Create a new branch based on the development branch with a sweet name: `git checkout -b <myNewFeature>  development`
5. Do some [programming](http://programming-motherfucker.com).
6. Commit often and meaningfully.
7. Write [TTD](http://) when applicable.
6. Keep your code nice and clean by adhering to the coding standards & guidelines.
7. Don't break tests or functionality.
8. When you are done push your branch to origin
    `git push origin <myNewFeature>`
9. Go to our project's page in github.
10. Change to `<myNewFeature>` branch.
11. Click Pull Request.
12. Make sure the `<base>` is "development" and `<compare>` is "myNewFeature"
13. Write comments on what you did or what you changed.
14. Pull Requests need to be review by someone else. DO NOT MERGE YOUR OWN PULL REQUESTS.
14. If you are working with someone else in specific areas of the project select the person(s)
  from the right hand menu "Reviewers" and send the Pull Request if that is not the case just
  send it anyone can pick your Pull Request.
15. Once your Pull Request has been merged delete your `<myNewFeature>` branch.
  `git branch -d <myNewFeature>`
16. Repeat.  



gems required:
`check if you have gems: gem list`
`pg`, `pry`, `sinatra-contrib`, `sinatra`
