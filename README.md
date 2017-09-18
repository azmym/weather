# 1 Description
Weather web application, using Spring stack and AngularJS 

# 2 How to start
* install mysql (I installed mysql 5.7)
* open/import the project in your favorite IDE
* if you didn't change defult port (3306) skip this step, otherwise update the datasource URL 
	* navigate to src/main/resources/application.properties
	* change the datasource URL port from 3306 to your port
* there is two ways to prepare the DB
	* first, let the hibernate create the tables and populate the data
	* second manually
		* change the value of spring.jpa.hibernate.ddl-auto to none in application.properties
		* execute SQLs queries in queries.sql file
	*note, with first choice the table will be dropped and created with each run, so any new data will be losted
		but with second choice data will persist and can use it next run
	*third, after first run change the value of spring.jpa.hibernate.ddl-auto to none, it is way combined first and second approaches
		and data will be persisted and can use it next run 
* to start the application, there is two ways
	* first from IDE , execute com.orange.weather.WeatherApplication::main to start an embedded http server
	* second using mvn (make sure you have installed it)
		* navigate to project folder run mvn clean install
		* then run java -jar target/weather-0.0.1-SNAPSHOT.jar
* open http://localhost:8080/
	* you can create new user with role 'User'
	* you can use admin credential mahmoud.azmy@gmail.com/admin

# 3 The architecture
* The architecture of the web service is built with the following components:
   * DataTransferObjects: Objects which are used for outside communication via the API
   * Controller: Implements the processing logic of the web service, parsing of parameters and validation of in- and outputs.
   * Service: Implements the business logic and handles the access to the DataAccessObjects.
   * DataAccessObjects: Interface for the database. Inserts, updates, deletes and reads objects from the database.
   * DomainObjects: Functional Objects which might be persisted in the database.

# 4  Technologies
* The application has been build with following technologies:
   * Java 1.8
   * Spring MVC with Spring Boot
   * Spring Data
   * Spring Security
   * Jackson
   * Hibernate
   * MySQL
   * Maven
   * AngularJs
   * bootstrap
   
# 5 Test coverage
* There are 53 test case have been implemented.
* according to EclEmma tool, the test cover 86.5%.