import UIKit
import Foundation


//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct queuer <Lecture: Comparable>{
    var items = [Lecture]()
    mutating func add (_ item: Lecture){
        items.append(item)
    }
    
    mutating func next() -> Lecture{
print ("Next \(items.first!)")
return items.removeFirst()
    }
    
    func filter (item: Lecture) {
        print ("Find \(items.filter{$0 == item})")
    }

    mutating func propertySort() -> [Lecture] {
        return items.sorted(by: <)
    }

    subscript (index: Int) -> Lecture? {
        return (index < items.count ? items[index] : nil)
    }
}

    var round = queuer<String>(items:["Name"])
round.add("Marketing")
round.add("Psychology")
round.add("SoftSkills")
print (round.items)
print("Sorted \(round.propertySort())")

round.next ()
round.next ()
