User table
Columns | Datatypes
--------| -----------
id      |   integer
name    |    text
type    |    string
email   |     string


   task table
columns    |  datatypes
---------- |------------
 id        | integer
user_id(fk)| references
name       | string
status     | string
priority   | integer
start_date | timedate
end_date   | timedate
content    | text


   labeling table
columns     |   datatypes
----------  |----------
 id         |   integer
task_id(fk) | references
label_id(fk)| references

Steps to deploy application to heroku
1. Create heroku account
2. Install heroku on local environment
3. use command 'heroku login --interactive' to enter the email and password used while creating heroku account
4. push to github(optional)
   1. git add .
   2. git commit -m "commit message"
   3. git remote add origin <git repository url>
   4. git push origin <name of branch>
4. Once you are logged in use command 'heroku create' in the application dorectory to create application on heroku and associate it with the directory
5. use command 'git push heroku master' to deploy
6. use the command 'git run rake db:migrate' to migrate application
7. By using the heroku website login into your account and open your app
