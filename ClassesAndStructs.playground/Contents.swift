import Foundation

//  MARK: - CLASSES WITH MEMORY LEAK

final class Laptop {
    var smartphone: Smartphone?
    deinit {
        print("\(self) is being deinitialized")
    }
}

final class Smartphone {
    var laptop: Laptop?
    deinit {
        print("\(self) is being deinitialized")
    }
}

var newLaptop: Laptop?
newLaptop = Laptop()

var newSmartphone: Smartphone?
newSmartphone = Smartphone()

newLaptop?.smartphone = newSmartphone
newSmartphone?.laptop = newLaptop

newLaptop = nil
newSmartphone = nil

//  MARK: - CLASS SINGLETON

final class NetworkManager {
    static let shared = NetworkManager()
    
    let name = "The Singleton"
    
    private init() {}
    
    func checkConnection() -> String {
        return "Connection is established"
    }
}

//  MARK: - CLASS

class Vehicle: CustomStringConvertible {
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
        return "Название: \(name), Цена: \(price). Скорость: \(speed)."
    }
    
    func speedForPrice() -> String {
        return "Цена за километр в час: \(price / speed)"
    }
}

let newVehicle = Vehicle(name: "Cars", price: 1000000, countInStock: 10)
print(newVehicle)

let newCar = Car(name: "Ferrari", price: 1000000, countInStock: 10, speed: 320)
print(newCar)
print(newCar.speedForPrice())

//  MARK: - STRUCT

struct User {
    let name: String
    let surname: String
    let age: Int
    
    func tellAboutMe() -> [Any] {
        return [name, surname, age]
    }
}

let newUser = User(name: "John", surname: "Davis", age: 25)
print(newUser.tellAboutMe())

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

//  MARK: - ENUM (Version 2)

enum Vegetables {
    case Tomato(quality: TheQuality)
    case Potato(quallity: TheQuality)
    
    enum TheQuality: CustomStringConvertible {
        case fresh
        case normal
        case raw
        
        var description: String {
            switch self {
            case .fresh:
                return "Свежий"
            case .normal:
                return "Обычный"
            case .raw:
                return "Сырой"
            }
        }
    }
}

let firstVegetable = Vegetables.Potato(quallity: .raw)
print(firstVegetable)

//  MARK: - ENUM (Version 3)

enum Fruits: Int {
    case Apple = 15
    case Orange = 20
    case Mango = 10
}

let firstFruits = Fruits(rawValue: 20)
print(firstFruits ?? "Nothing")

