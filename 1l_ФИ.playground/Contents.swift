//Первое задание

import Foundation
let a: Double = 4
let b: Double = 8
let c: Double = 2
var d = (b*b-4*a*c)
var x = ((-b + sqrt (d))/(2*a))
var y = ((-b - sqrt (d))/(2*a))
if (d>0) {print ("Первый корень равен ",x,", второй корень равен",y)}
else if (d==0) {print("Корень равен",x)}
else {print("Нет корней")}


//Второе задание
let u: Double = 7
let i: Double = 5
var s = u*i/2
var p = u+i+sqrt(u*u+i*i)
var g = sqrt(u*u+i*i)
print ("Площадь равна ",s,", периметр равен ",p,", гипатинуза равна",g)



//Третье задание
let m: Double = 100000
let z: Double = 1.07
var k = (m*z+m*z*z+m*z*z*z+m*z*z*z*z+m*z*z*z*z*z)
print ("Через 5 лет сумма вклада составит",k)
