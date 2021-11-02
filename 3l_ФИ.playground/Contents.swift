import UIKit
import Foundation
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum carEngine {
    case запущен, выключен
}
enum carWindow {
    case открыты, закрыты
}
enum carTrunk {
    case заполнен, пуст
}
//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar. Структуры должны содержать: марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
struct sportCar {
    let brand: String
    let year: Int
    let volumeTrunk: Int
    let volumeBody: Int
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    var engine: carEngine
    mutating func startEngine(){
        self .engine = .запущен
        self .engine = .выключен
    }
    var window: carWindow
    mutating func openWindow(){
        self .window = .открыты
        self .window = .закрыты
    }
    var trunk: carTrunk
    mutating func putInTrunk(){
        self .trunk = .пуст
        self .trunk = .заполнен
    }
}
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var firstCar = sportCar (brand: "Porsche", year: 2015, volumeTrunk: 20, volumeBody: 100, engine: .запущен, window: .закрыты, trunk: .пуст)
firstCar.engine = .запущен
firstCar.window = .открыты
firstCar.trunk = .заполнен
//Вывести значения свойств экземпляров в консоль.
print ("Гоночная машина", firstCar.brand, ", ", firstCar.year," года выпуска с объемом багажника ",firstCar.volumeTrunk,"л, объемом кузова", firstCar.volumeBody,"л, двигатель ", firstCar.engine, ", окна ",firstCar.window,", багажник",firstCar.trunk)



//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar. Структуры должны содержать: марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
struct trunkCar {
    let brand: String
    let year: Int
    let volumeTrunk: Int
    let volumeBody: Int
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    var engine: carEngine
    mutating func startEngine(){
        self .engine = .запущен
        self .engine = .выключен
    }
    var window: carWindow
    mutating func openWindow(){
        self .window = .открыты
        self .window = .закрыты
    }
    var trunk: carTrunk
    mutating func putInTrunk(){
        self .trunk = .пуст
        self .trunk = .заполнен
    }
}
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var secondCar = trunkCar (brand: "VolksWagen", year: 2011, volumeTrunk: 40, volumeBody: 220, engine: .выключен, window: .закрыты, trunk: .пуст)
secondCar.engine = .запущен
secondCar.window = .открыты
secondCar.trunk = .заполнен
//Вывести значения свойств экземпляров в консоль.
print ("Грузовая машина", secondCar.brand, ", ", secondCar.year," года выпуска с объемом багажника ",secondCar.volumeTrunk,"л, объемом кузова", secondCar.volumeBody,"л, двигатель ", secondCar.engine, ", окна ",secondCar.window,", багажник",secondCar.trunk)
