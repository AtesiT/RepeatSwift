import Foundation

//  Class

class BankAccount {
    var balance: Double
    
    init(balance: Double) {
        self.balance = balance
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) {
        if balance < amount {
            print("Недостаточно средств")
            return
        }
        balance -= amount
    }
}

let account = BankAccount(balance: 1000.0)
account.deposit(amount: 500.0)
account.withdraw(amount: 200.0)
print(account.balance)
account.withdraw(amount: 2000)
