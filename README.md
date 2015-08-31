# merakart
How to run this application

1. First Run the bundle command
``` bundle install ```
2. Then create and migrate the database using
``` rake db:create and rake db:migrate ```
3. Have the dummy data through the dump named databse.sql using the command
``` mysqldump -u [user_name] -p[password] [database_name] < (database.sql)_file_full_path_with_extension ```
4. You are good to go..