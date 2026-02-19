import Foundation

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


