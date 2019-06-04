#Bookmark Manager

##Setup instructions
1. Connect to `psql`
2. Create database by running `CREATE DATABASE bookmark_manager WITH ENCODING 'UTF8';`
3. Connect to the database using psql command `\c bookmark_manager`
4. Run the query saved in the file [./db/migrations/01_create_bookmarks_table.sql](./db/migrations/01_create_bookmarks_table.sql)


##Model
![IMG_4658](https://user-images.githubusercontent.com/16557524/58863790-68f61c80-86ab-11e9-85a7-9ac85ae2a4a6.JPG)