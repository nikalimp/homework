import UIKit
import Foundation
//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
enum buySubscriptionError: Error {
    case noMoney (moneyNeeded: Int)
    case frozenBalance
}
struct Subscription {
    var price: Int
}
class buyOperation {
    let limit: Int = -1000
    var balance: Int = 4000
    var cardIsBlocked = false
    func buySubscrtiption(Subscription: Subscription)throws {
        guard cardIsBlocked == false else{
            throw buySubscriptionError.frozenBalance
        }
        guard Subscription.price <= (-limit + self.balance) else {
            if balance < 0 {
                throw buySubscriptionError.noMoney(moneyNeeded: Subscription.price + limit + balance)
            } else {
                throw buySubscriptionError.noMoney(moneyNeeded: Subscription.price + limit - balance)
            }
        }
        balance = self.balance - Subscription.price
    }
    func depositeMoney (someMoney: Int) {
        balance = self.balance + someMoney
    }

    func printBalance() {
        print ("Balance is \(balance) rub")
    }
    func changeCardState(cardIsBlocked: Bool) {
        switch cardIsBlocked {
        case true:
            self.cardIsBlocked = true
        case false:
            self.cardIsBlocked = false
        }
    }
}
extension buySubscriptionError: CustomStringConvertible {
    var description: String {
        switch self {
        case .noMoney(let moneyNeeded): return "Нет денег на карте, ваш баланс \(operation.balance) рублей, надо: \(moneyNeeded) рублей"
        case .frozenBalance: return "Ваш балан заморожен"
        }
    }
}
let operation = buyOperation()
do {
    try operation.buySubscrtiption(Subscription: .init(price: 369))
} catch let error as buySubscriptionError {
    print(error.description)
}
operation.printBalance()
operation.depositeMoney(someMoney: 900)
operation.printBalance()
do {
    try operation.buySubscrtiption(Subscription: .init(price: 369))
} catch let error as buySubscriptionError {
    print(error.description)
}
operation.printBalance()
do {
    try operation.buySubscrtiption(Subscription: .init(price: 369))
} catch let error as buySubscriptionError {
    print(error.description)
}
operation.printBalance()
operation.changeCardState(cardIsBlocked: true)
do {
    try operation.buySubscrtiption(Subscription: .init(price: 90))
} catch let error as buySubscriptionError {
    print(error.description)
}
