# A JDBC application with an appropriately layered architecture used to process rental agreements for SoundGood music school

## How to execute

1. Clone this git repository
1. Change to the newly created directory `cd jdbc-sgms`
1. Make sure there is a database which can be reached with the url on line 74-75 in `SchoolDAO.java`. There are two ways to do this.
   1. Create a database called sgms, wich can be
      reached on port 5432 at localhost, by the user 'postgres' with the
      password 'postgres'.
   1. Change the url to match your database.
1. Create the tables by running `src/main/resources/create_db.sql`  
1. Populate the database by running `src/main/resources/populate_db.sql`
1. Run the program from `src/main/java/se/kth/iv1351/sgms/startup/Main.java`

## Commands for the program

* `help` displays all commands.
* `list` lists all instruments available for rent.
* `list <instrument type>` lists all instruments of specified type which are available for rent.
* `rent <personal number> <instrument ID>` creates new rental agreement of specified instrument for specified person.
* `agreements` lists all active rental agreements. (useful to find rental agreements before termination)
* `terminate <rental agreement ID>` terminates rental agreement with the specified ID.
* `quit` quits the application.
