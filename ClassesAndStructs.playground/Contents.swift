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
    
    var description: String {
        return "Название: \(name), Цена: \(price)."
    }
}

final class Car: Vehicle {
    let speed: Int
    
    init(name: String, price: Int, countInStock: Int, speed: Int) {
        self.speed = speed
        
        super.init(name: name, price: price, countInStock: countInStock)
    }
    
    override var description: String {
        return "Название: \(name), Цена: \(price). Скорость: \(speedDescription())."
    }
    
    func speedDescription() -> String {
        return "Скорость: \(speed) км/ч."
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

//  MARK: - ENUM

enum Phone {
    case iPhone
    case Samsung
    case Microsoft
    
    enum iPhoneVersion: String {
        case Air = "Air"
        case Pro = "Pro"
    }
    
    enum SamsungVersion: String {
        case S = "S"
        case Note = "Note"
    }
    
    enum MicrosoftVersion: String {
        case Surface = "Surface"
        case Laptop = "Laptop"
    }
    
    var title: String {
        switch self {
        case .iPhone:
            return "iPhone 7"
        case .Samsung:
            return "Samsung Galaxy S7"
        case .Microsoft:
            return "Microsoft Lumia"
        }
    }
}

let firstPhone = Phone.MicrosoftVersion.Surface
let secondPhone = Phone.iPhone.title
let thirdPhone = Phone.Microsoft

print(firstPhone)
print(secondPhone)
print(thirdPhone)
