import UIKit
import Foundation

enum window {
    case open,close
}
enum engine {
    case on,off
}
enum turbo {
    case on,off
}
enum trunk {
    case empty, full
}

//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol car: AnyObject {
    var brand:String {get}
    var year:Int {get}
    var window:window {get set}
    var engine:engine {get set}
    }

//Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension car{
    func window (status:window){
    switch status {
    case .open:
        print ("\(brand): windows are open")
        self.window = .open
    case .close:
        print ("\(brand): windows are close")
        self.window = .close
    }
}
    func engine (status:engine){
    switch status {
    case .on:
        print ("\(brand): engine is on")
        self.engine = .on
    case .off:
        print ("\(brand): engine is off")
        self.engine = .off
    }
}
}

protocol SportCar: car{
    var turbo: turbo {get set}
}

extension SportCar {
    func turbo (status:turbo){
    switch status {
    case .on:
        print ("\(brand): turbo is on")
        self.turbo = .on
    case .off:
        print ("\(brand): turbo is off")
        self.turbo = .off
    }
}
}

protocol TrunkCar: car{
    var trunk: trunk {get set}
}

extension TrunkCar {
    func trunk (status:trunk){
    switch status {
    case .empty:
        print ("\(brand): trunk is empty")
        self.trunk = .empty
    case .full:
        print ("\(brand): trunk is full")
        self.trunk = .full
    }
}
}
//Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class sportCar: SportCar {
    var brand: String
    var year: Int
    var window: window
    var engine: engine
    var turbo: turbo
    init(brand: String, year: Int, window: window, engine: engine, turbo: turbo){
    self.brand = brand
    self.year = year
    self.window = .close
    self.engine = .off
    self.turbo = .on
}
}
class trunkCar: TrunkCar {
    var brand: String
    var year: Int
    var window: window
    var engine: engine
    var trunk: trunk
    init(brand: String, year: Int, window: window, engine: engine, trunk: trunk){
    self.brand = brand
    self.year = year
    self.window = .close
    self.engine = .off
    self.trunk = .full
}
}

//Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
    extension sportCar: CustomStringConvertible{
        var description: String {
        return "Auto: \(brand)\n" +
        "year: \(year)\n" +
        "window: \(window)\n" +
        "engine: \(engine)\n" +
        "turbo: \(turbo)\n"
    }
}
extension trunkCar: CustomStringConvertible{
    var description: String {
    return "Auto: \(brand)\n" +
    "year: \(year)\n" +
    "window: \(window)\n" +
    "engine: \(engine)\n" +
    "trunk: \(trunk)\n"
}
}

//Создать несколько объектов каждого класса. Применить к ним различные действия.
var sportCar1 = sportCar (brand: "Posche", year: 2015, window: .close, engine: .on, turbo: .on)
var trunkCar1 = trunkCar (brand: "VW", year: 2010, window: .close, engine: .on, trunk: .full)

//Вывести сами объекты в консоль.
print (sportCar1)
print (trunkCar1)
