//
//  SOLID Principle.swift
//  SelfPractice
//
//  Created by Lingam on 28/08/24.
//

import Foundation


//1.Single Responsibilities Principles :


class UserDetails{
    
    var name : String
    var password : String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
   
}


class ValidateUser{
    
    func isValidate(user:UserDetails) -> Bool{
        return !user.name.isEmpty && !user.password.isEmpty
    }
}



//2.Open - Close Principles :

// Bad EXAMPLE :

class Shapes {
    var type: String
    
    init(type: String) {
        self.type = type
    }
    
    func area() -> Double {
        if type == "circle" {
            return 3.14 * 5 * 5 // Example for circle
        } else if type == "rectangle" {
            return 5 * 4 // Example for rectangle
        }
        return 0
    }
}

// Good Example

protocol Shape{
    func area() -> Double
}

class Circle : Shape{
    
    var radius : Double
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
    
}


//3.Liskov Principles


//Bad Example
class Birds {
    func fly() {
        print("I'm flying!")
    }
}

class Penguin: Birds {
    override func fly() {
        print("I can't fly.")
    }
}

//Good Example


class Bird{
    func move(){
        print("moving")
    }
}

class Parrot:Bird{
    override func move() {
        print("i can fly")
    }
}

class Penguins:Bird{
    override func move() {
        print("i can walk")
    }
}


//4.InterFace Segregation Principles

    // Bad Example

protocol workers{
    func worker()
}

protocol Manager{
    func manager()
}


class Emloyee:workers{
    func worker() {
        print("working")
    }
    
    func manager() {
        print("i am not a manager , its not needed here to implemet")
    }
}


// Good Example

class Emplyoee:workers{
    func worker() {
        print(" i am subordinate")
    }
}

class Managers : workers,Manager{
    func worker() {
        print("i can work")
    }
    
    func manager() {
        print("i can manage")
    }
    
    
}


//5.Dependency Inversion Principles

// Bad example

class MySQLDatabases {
    func connect() {
        print("Connecting to MySQL Database")
    }
}

class DatabaseManagers {
    private var database: MySQLDatabases
    
    init(database: MySQLDatabases) {
        self.database = database
    }
    
    func connect() {
        database.connect()
    }
}


// Good Examplr

protocol Database {
    func connect()
}

class MySQLDatabase: Database {
    func connect() {
        print("Connecting to MySQL Database")
    }
}

class PostgreSQLDatabase: Database {
    func connect() {
        print("Connecting to PostgreSQL Database")
    }
}

class DatabaseManager {
    private var database: Database
    
    init(database: Database) {
        self.database = database
    }
    
    func connect() {
        database.connect()
    }
}

