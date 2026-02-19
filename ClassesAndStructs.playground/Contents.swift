import Foundation

//  MARK: - CLASS

class Vehicle {
    let name: String
    let price: Int
    let countInStock: Int
    
    init(name: String, price: Int, countInStock: Int) {
        self.name = name
        self.price = price
        self.countInStock = countInStock
    }
}

final class Car: Vehicle {
    let speed: Int
    
    init(name: String, price: Int, countInStock: Int, speed: Int) {
        self.speed = speed
        
        super.init(name: name, price: price, countInStock: countInStock)
    }
}

//  MARK: - STRUCT

struct User {
    let name: String
    let surname: String
    let age: Int
    
    func tellAboutMe() -> [Any] {
        return [name, surname, age]
    }
}
