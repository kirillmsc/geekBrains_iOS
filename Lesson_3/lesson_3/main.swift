////
////  main.swift
////  Lesson_3
////
////  Created by k.kochemasov on 05/03/2019.
////  Copyright © 2019 k.kochemasov. All rights reserved.
////
//
////1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
////
////2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
////
////3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
////
////4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
////
////5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
////
////6. Вывести значения свойств экземпляров в консоль.
//
//
//
import Foundation

enum Weight {
    case light, heavy
}

enum WindowsState {
    case open, close
}

enum Engine {
    case start, off
}

enum OccupVolume {
    case empty, full
}

enum DoorState {
    case open, close
}

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
struct Car {
    let mark : String
    let year : Int
    var trunkVolume : Int
    var engine : Engine
    var windowsState : WindowsState
    var occupiedVolume : OccupVolume
    var cargoVol : Int
    
    mutating func changeWindowsState(){
        windowsState = windowsState == .open ? .close : .open
    }
    
    mutating func changeEngineState(){
        engine = engine == .start ? .off : .start
    }
    
    mutating func changeOccupiedVolume(cargo: Int){
        if cargoVol+cargo <= trunkVolume {
            cargoVol += cargo
        } else {
            print("Overload")
        }
    }
}

struct Truck {
    let mark : String
    let year : Int
    var trunkVolume : Int
    var engine : Engine
    var windowsState : WindowsState
    var occupiedVolume : OccupVolume
    var cargoVol : Int
    
    mutating func changeWindowsState(){
        windowsState = windowsState == .open ? .close : .open
    }
    
    mutating func changeEngineState(){
        engine = engine == .start ? .off : .start
    }
    
    mutating func changeOccupiedVolume(cargo: Int){
        if cargoVol+cargo <= trunkVolume && cargoVol+cargo >= 0 {
            cargoVol += cargo
            occupiedVolume = cargoVol == 0 ? .empty : .full
        } else if cargoVol + cargo < 0 {
            print("Not enought cargo")
        } else {
            print("Overload")
        }
    }
}

struct House {
    let material : String
    var square : Int
    var windowsState : WindowsState
    var doorsState : DoorState
    
    mutating func changeWindowsState(){
        windowsState = windowsState == .open ? .close : .open
    }
    
    mutating func changeDoorsState(){
        doorsState = doorsState == .open ? .close : .open
    }
}

//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
var bmw = Car(mark: "bmw", year: 2017, trunkVolume: 5, engine: .start, windowsState: .close, occupiedVolume: .full, cargoVol: 1)
var man = Truck(mark: "man", year: 2014, trunkVolume: 19, engine: .off, windowsState: .open, occupiedVolume: .full, cargoVol: 10)
var house = House(material: "wood", square: 150, windowsState: .close, doorsState: .open)

print(bmw.engine)
bmw.changeEngineState()
print(bmw.engine)
print(man.occupiedVolume)
print(man.cargoVol)
man.changeOccupiedVolume(cargo: 8) // add
print(man.occupiedVolume)
print(man.cargoVol)
man.changeOccupiedVolume(cargo: 2) // add over than truck value
man.changeOccupiedVolume(cargo: -20) // remove all cargo
man.changeOccupiedVolume(cargo: -18) // remove cargo from empty truck
print(man.occupiedVolume)
print(man.cargoVol)

print("House build from \(house.material)")
print("Windows in da house are \(house.windowsState)")
house.changeWindowsState()
print("Now windows in the house are \(house.windowsState)")
print("Doors in da house are \(house.doorsState)")
house.changeDoorsState()
print("Now doors in the house are \(house.doorsState)")
