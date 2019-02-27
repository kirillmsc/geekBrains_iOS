//
//  main.swift
//  homeWork_L01
//
//  Created by k.kochemasov on 26/02/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//

import Foundation

// equation
print("Hello, print a: ")
var a = Double(readLine()!)
print("Now print b: ")
var b = Double(readLine()!)
print("Now print c: ")
var c = Double(readLine()!)
print("Now we'll find the roots of the equation \(a!)x^2+\(b!)x+\(c!)=0")
var d = b!*b!-4*a!*c!
if d > 0{
    print("D=\(d). D>0, we have two roots.")
    print("X1: \((-1*b!+sqrt(d))/(2*a!)), X2: \((-1*b!-sqrt(d))/(2*a!))")
}else if d == 0{
    print("D=\(d). D=0, we have one root.")
    print("X: \((-1*b!)/(2*a!))")
}else if d < 0{
    print("D=\(d). D<0, we don't have roots.")
}


//===========================================================================
// triangle
print("Enter the length of the first leg: ")
let firstLeg = Double(readLine()!)
print("Enter the length of the second leg: ")
let secondtLeg = Double(readLine()!)
let hypo = sqrt(pow(firstLeg!, 2)+pow(secondtLeg!, 2))
print("Square of the triangle is \((firstLeg!*secondtLeg!)/2)")
print("Perimetr of the triangle is \(firstLeg!+secondtLeg!+hypo)")
print("Hypotenusa of the triangle is \(hypo)")


//===========================================================================
// bank
print("Enter deposit amount: ")
var deposit = Double(readLine()!)
print("Enter interest rate: ")
let rate = Double(readLine()!)
var year = 5
while year > 0 {
    deposit = deposit!/100*rate! + deposit!
    year -= 1
}
print("Your deposit after 5 year is \(deposit!)")
//===========================================================================
