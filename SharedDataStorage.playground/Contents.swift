import Foundation

final class DataStore {
    static let shared = DataStore()
    
    private init() {}
}

extension DataStore {
    
    func sayHello() {
        print("Hello, World!")
    }
    
}
