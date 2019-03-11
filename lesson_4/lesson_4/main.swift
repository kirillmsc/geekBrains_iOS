//
//  main.swift
//  lesson_4
//
//  Created by k.kochemasov on 11/03/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//
/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/

import Foundation

enum WindowsState {
    case open, close
}

enum Engine {
    case start, off
}

enum EngineType {
    case turbo, atmo
}

enum VolumeStatus {
    case empty, full
}

enum Gasoline {
    case ai100, diesel, ai92
}

enum Wheels {
    case summer, winter, bigfoot, sport
}

class Car {
    var mark : String
    var year : Int
    var engine : Engine
    var enginePower : Int
    var gasoline : Gasoline
    var windowsState : WindowsState
    var wheels : Wheels
    var info : String {
        get {
            return("Mark of the car is \(mark)\n Year of the car is \(year) \n Engine is \(engine) \n Engine power is \(enginePower) \n Windows are \(windowsState) \n")
        }
    }
    init(mark: String, year: Int, engine: Engine, enginePower: Int, gasoline: Gasoline, windowsState: WindowsState, wheels: Wheels) {
        self.mark = mark
        self.year = year
        self.engine = engine
        self.enginePower = enginePower
        self.gasoline = gasoline
        self.windowsState = windowsState
        self.wheels = wheels
    }
    
    func changeWindowsState(){
        windowsState = windowsState == .open ? .close : .open
    }
    
    func changeEngineState(){
        engine = engine == .start ? .off : .start
    }
    
    func changewheel(){
        wheels = wheels == .winter ? .summer : .winter
    }
}

class SuperCar: Car {
    var engineType : EngineType
    
    init(mark: String, year: Int, engine: Engine, enginePower: Int, gasoline: Gasoline, windowsState: WindowsState, engineType: EngineType, wheels: Wheels) {
        self.engineType = engineType
        super.init(mark: mark, year: year, engine: engine, enginePower: enginePower, gasoline: gasoline, windowsState: windowsState, wheels: wheels)
    }
    
    func changeTurbo(){
        engineType = engineType == .turbo ? .atmo : .turbo
    }
    
    override func changewheel() {
        wheels = wheels == .sport ? .sport : .sport
    }
    
}

class TrunkCar: Car {
    var volumeStatus : VolumeStatus
    
    init(mark: String, year: Int, engine: Engine, enginePower: Int, gasoline: Gasoline, windowsState: WindowsState, trunkVolume : Int, volumeStatus : VolumeStatus, wheels: Wheels) {
        self.volumeStatus = volumeStatus
        super.init(mark: mark, year: year, engine: engine, enginePower: enginePower, gasoline: gasoline, windowsState: windowsState, wheels: wheels)
    }
    
    func upload(){
        volumeStatus = volumeStatus == .full ? .empty : .empty
    }
    
    func load(){
        volumeStatus = volumeStatus == .empty ? .full : .full
    }
    // написано две функции по причине того, что решил сделать осмысленную погрузку и разгрузку, а не просто изменение статуса заполнености кузова
    
    override func changewheel() {
        wheels = wheels == .bigfoot ? .bigfoot : .bigfoot
    }
    // увы, не смог придумать что-либо, что можно изменить в зависимости от типа автомобиля, поэтому для грузовиков будут жирные колёса и добавлен новый наследник
}

class CityCar: Car {
}

var viper = SuperCar(mark: "Dodge", year: 1990, engine: .off, enginePower: 300, gasoline: .ai100, windowsState: .close, engineType: .atmo, wheels: .summer)
var camaro = SuperCar(mark: "Shevrolet", year: 2000, engine: .off, enginePower: 350, gasoline: .ai100, windowsState: .close, engineType: .turbo, wheels: .winter)
var man = TrunkCar(mark: "MAN", year: 2010, engine: .off, enginePower: 200, gasoline: .diesel, windowsState: .close, trunkVolume: 30, volumeStatus: .empty, wheels: .summer)
var kamaz = TrunkCar(mark: "MAZ", year: 1990, engine: .off, enginePower: 100, gasoline: .diesel, windowsState: .open, trunkVolume: 20, volumeStatus: .empty, wheels: .winter)
var rio = CityCar(mark: "KIA", year: 2012, engine: .off, enginePower: 123, gasoline: .ai92, windowsState: .close, wheels: .summer)

print(rio.wheels)
rio.changewheel()
print(rio.wheels)
print(kamaz.wheels)
kamaz.changewheel()
print(kamaz.wheels)
print(camaro.wheels)
camaro.changewheel()
print(camaro.wheels)
print(viper.info)
print(camaro.info)
print(man.info)
