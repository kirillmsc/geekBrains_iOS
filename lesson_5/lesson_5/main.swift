//
//  main.swift
//  lesson_5
//
//  Created by k.kochemasov on 13/03/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
 */
import Foundation

enum WindowsState {
    case close, open
}

enum EngineState {
    case on, off
}

enum DoorsState {
    case close, open
}

enum Type {
    case sport, truck
}

enum NO2 {
    case on, off
}

enum Trunk {
    case full, empty
}

protocol Car {
    var mark : String { get set }
    var color : String { get set }
    var year : Int { get set }
    var windows : WindowsState { get set }
    var engine : EngineState { get set }
    var doors : DoorsState { get set }
}

extension Car {
    mutating func changeWindowsState(){
        windows = windows == .close ? .open : .close
    }
}
extension Car {
    mutating func changeEngineState(){
        engine = engine == .off ? .on : .off
    }
}
extension Car {
    mutating func changeDoorsState(){
        doors = doors == .close ? .open : .close
    }
}

class TruckCar: Car {
    var mark: String
    var color: String
    var year: Int
    var windows: WindowsState
    var engine: EngineState
    var doors: DoorsState
    var type: Type = .truck
    var trunk: Trunk
    init(mark: String, color: String, year: Int, windows: WindowsState, engine: EngineState, doors: DoorsState, type: Type, trunk: Trunk) {
        self.type = type
        self.trunk = trunk
        self.mark = mark
        self.color = color
        self.year = year
        self.windows = windows
        self.engine = engine
        self.doors = doors

    }
    func changeTrunkState() {
        trunk = trunk == .full ? .empty : .full
    }
}

class SportCar: Car {
    var mark: String
    var color: String
    var year: Int
    var windows: WindowsState
    var engine: EngineState
    var doors: DoorsState
    var type: Type = .sport
    var azot: NO2
    init(mark: String, color: String, year: Int, windows: WindowsState, engine: EngineState, doors: DoorsState, type: Type, azot: NO2) {
        self.type = type
        self.azot = azot
        self.mark = mark
        self.color = color
        self.year = year
        self.windows = windows
        self.engine = engine
        self.doors = doors

    }
}
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension TruckCar: CustomStringConvertible {
    var description: String {
        return "Mark is \(mark) \nColor is \(color) \nYear is \(year)"
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Mark is \(mark) \nColor is \(color) \nYear is \(year)"
    }
}
//=================================================
var kamaz = TruckCar(mark: "maz", color: "gray", year: 1990, windows: .close, engine: .off, doors: .close, type: .truck, trunk: .empty)
var buble = SportCar(mark: "Toyota", color: "yellow", year: 2017, windows: .close, engine: .off, doors: .close, type: .sport, azot: .off)

print("Текущее состояние")
print("Windows are \(kamaz.windows)")
print("Doors are \(kamaz.doors)")
print("Engine are \(kamaz.engine)")
print("Trunk is \(kamaz.trunk)")
print("")
kamaz.changeDoorsState()
kamaz.changeEngineState()
kamaz.changeWindowsState()
kamaz.changeTrunkState()
print("")
print("Windows are \(kamaz.windows)")
print("Doors are \(kamaz.doors)")
print("Engine are \(kamaz.engine)")
print("Trunk is \(kamaz.trunk)")

print(kamaz)
print(buble)
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
 */

