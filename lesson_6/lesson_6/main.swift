//
//  main.swift
//  lesson_6
//
//  Created by k.kochemasov on 17/03/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//

import Foundation
//
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
//

protocol ShelfLife {
    var shelfLife: Int {get set}
}

enum MeatType {
    case pig, cow, chicken
}

enum CheeseType {
    case holland, brie
}

class Meat: ShelfLife {
    var meat : MeatType
    var shelfLife: Int
    
    init(meat: MeatType, shelfLife: Int) {
        self.meat = meat
        self.shelfLife = shelfLife
    }
}

class Cheese: ShelfLife {
    var cheese: CheeseType
    var shelfLife: Int
    
    init(cheese: CheeseType, shelfLife: Int) {
        self.cheese = cheese
        self.shelfLife = shelfLife
    }
}

extension Meat: CustomStringConvertible{
    var description: String {
        return "\nMeat of \(meat) and shelf life — \(shelfLife)"
    }
}

extension Cheese: CustomStringConvertible{
    var description: String {
        return "\nCheese \(cheese) and shelf life — \(shelfLife)"
    }
}

struct Queue<T> {
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.removeFirst()
    }

    
    subscript (position: Int) -> T? {
        if position >= 0 && position < elements.count  {
            return elements[position]
        }
            return nil
    }
}

var meatSupermarket = Queue<Meat>()
var cheeseSupermarket = Queue<Cheese>()

meatSupermarket.push(Meat(meat: .pig, shelfLife: 10))
meatSupermarket.push(Meat(meat: .cow, shelfLife: 12))
meatSupermarket.push(Meat(meat: .chicken, shelfLife: 8))

cheeseSupermarket.push(Cheese(cheese: .brie, shelfLife: 20))
cheeseSupermarket.push(Cheese(cheese: .holland, shelfLife: 18))

var pigMeat = meatSupermarket[0]
var cowMeat = meatSupermarket[1]
var chickenMeat = meatSupermarket[2]
var brie = cheeseSupermarket[0]
var holland = cheeseSupermarket[1]

var productsShellLife: [ShelfLife] = [pigMeat!, cowMeat!, chickenMeat!, brie!, holland!]
print(productsShellLife)
print(productsShellLife.filter{$0.shelfLife > 9})

print(productsShellLife.map{$0.shelfLife + 5})

print(meatSupermarket)
print(cheeseSupermarket)
print(meatSupermarket.pop()!)
print(meatSupermarket)
print(meatSupermarket[1]!)
print(cheeseSupermarket[1]!)
print(meatSupermarket[3])
print(cheeseSupermarket[2])

//
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
//
