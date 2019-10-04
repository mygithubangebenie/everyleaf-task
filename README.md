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


