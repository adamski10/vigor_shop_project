
This application tracks inventory in the shop which sells organic food. The main functions of the program are:

- create, edit and save new products
- create, edit and save new manufacturers
- show total stock value


What is required to run the program: 

- Ruby installed
- PostgreSQL installeld
- Sinatra gem installed

To run this program follow the steps below:

1. In the terminal:

  - create database:     createdb vigor 
  - create tables with:  psql -d vigor -f db/vigor.sql
  - start server:        ruby vigor.rb
  
2. Open your browser and in the address bar enter:
  
  - http://localhost:4567/
  

From that point all the options should be ready to use.

To stop the program just close your browser as normal and stop sinatra in the terminal with ctrl^c.
