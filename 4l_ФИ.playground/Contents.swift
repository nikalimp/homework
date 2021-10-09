import UIKit
import Foundation
enum carEngine {
    case on, off
}
enum carWindow {
    case open, close
}
enum carTrunk {
    case full, empty
}
enum wheelDrive {
    case frontWheel, backWheel, fullWheel
}
enum gearbox {
    case mechanicGearbox, autoGearbox
}
enum multimedia {
    case mp3, bluetooth
}
enum brand {
    case Porsche, VolksWagen, Ferrari
}
enum stage {
    case first, second, third
}

class Car {
    let brand: brand
    let year: Int
    let volumeTrunk: Int
    let wheelDrive: wheelDrive
    var gearbox: gearbox
    var color: UIColor
    var multimedia: multimedia
    var carWindow: carWindow
    var carEngine: carEngine
    init (brand: brand, year: Int, volumeTrunk: Int, wheelDrive: wheelDrive, gearbox: gearbox, color: UIColor, multimedia: multimedia, carWindow:carWindow, carEngine:carEngine) {
    self.brand = brand
    self.year = year
    self.volumeTrunk = volumeTrunk
    self.wheelDrive = wheelDrive
    self.gearbox = gearbox
    self.color = color
    self.multimedia = multimedia
    self.carEngine = carEngine
    self.carWindow = carWindow
    }
    func openWindow() {
            carWindow = .open
        }
    func closeWindow() {
            carWindow = .close
        }
    func onEngine() {
            carEngine = .on
        }
    func offEngine() {
            carEngine = .off
        }
}

//Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
class sportCar: Car {
    var stage: stage
    init (brand: brand, year: Int, volumeTrunk: Int, wheelDrive: wheelDrive, gearbox: gearbox, color: UIColor, multimedia: multimedia, stage:stage, carWindow:carWindow, carEngine:carEngine) {
        self.stage = stage
        super.init (brand: brand, year: year, volumeTrunk: volumeTrunk, wheelDrive: wheelDrive, gearbox: gearbox, color: color, multimedia: multimedia, carWindow: carWindow, carEngine: carEngine)
    }
}
class trunkCar: Car {
    var carTrunk: carTrunk
    init (brand: brand, year: Int, volumeTrunk: Int, wheelDrive: wheelDrive, gearbox: gearbox, color: UIColor, multimedia: multimedia, carTrunk:carTrunk, carWindow:carWindow, carEngine:carEngine) {
        self.carTrunk = carTrunk
        super.init (brand: brand, year: year, volumeTrunk: volumeTrunk, wheelDrive: wheelDrive, gearbox: gearbox, color: color, multimedia: multimedia, carWindow: carWindow, carEngine: carEngine)
    }
}
//Создать несколько объектов каждого класса. Применить к ним различные действия.
    var car1 = Car(brand: .Porsche, year: 2015, volumeTrunk: 50, wheelDrive: .frontWheel, gearbox: .autoGearbox, color: .black, multimedia: .bluetooth, carWindow: .open, carEngine: .on)
    var car2 = sportCar(brand: .Ferrari, year: 2018, volumeTrunk: 20, wheelDrive: .frontWheel, gearbox: .autoGearbox, color: .red, multimedia: .bluetooth, stage: .second, carWindow: .close, carEngine: .on)
    var car3 = trunkCar(brand: .VolksWagen, year: 2012, volumeTrunk: 100, wheelDrive: .backWheel, gearbox: .mechanicGearbox, color: .black, multimedia: .mp3, carTrunk: .full, carWindow: .open, carEngine: .off)

//Вывести значения свойств экземпляров в консоль.
print ("Машина", car1.brand,", ",car1.year, " года выпуска, с объемом багажника ",car1.volumeTrunk, "литров,", car1.wheelDrive, "приводом, ",car1.gearbox, " коробкой передач, ", car1.color," цвета, мультимедией", car1.multimedia, car1.carWindow, " окнами и",car1.carEngine, "двигателем")
print ("Спортивная машина", car2.brand,", ",car2.year, " года выпуска, с объемом багажника ",car2.volumeTrunk, "литров,", car2.wheelDrive, "приводом, ",car2.gearbox, " коробкой передач, ", car2.color," цвета, мультимедией", car2.multimedia, car2.carWindow, " окнами и",car2.carEngine, "двигателем и стейджем", car2.stage)
print ("Грузовая  машина", car3.brand,", ",car3.year, " года выпуска, с объемом багажника ",car3.volumeTrunk, "литров,", car3.wheelDrive, "приводом, ",car3.gearbox, " коробкой передач, ", car3.color," цвета, мультимедией", car3.multimedia, car3.carWindow, " окнами и",car3.carEngine, "двигателем и багажником", car3.carTrunk)
