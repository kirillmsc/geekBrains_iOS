//
//  main.swift
//  lesson_7
//
//  Created by k.kochemasov on 21/03/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//
///
//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
///
import Foundation

enum City: String {
    case moscow = "Moscow"
    case toronto = "Toronto"
    case voronezh = "Voronezh"
    case omsk = "Omsk"
    
    func raw() -> String {
        return self.rawValue
    }
}

enum Reject: String, Error {
    case fromOmsk = "You can't leave Omsk"
    case money = "Not enough money"
    case youAreHere = "You are in this city"
    case priceZero = "No, price not Zero"
    
    func raw() -> String {
        return self.rawValue
    }
}

struct BoardingPass {
    var cost: Int
    var departure: City
    var destination: City
}

//print("Enter your credit")
//var credit = Int(readLine()!)!
var credit = 100000
var geolocation = ""

class AviaTickets {
    var destinationCity: City
    var departureCity: City
    var price: Int
    init(departureCity: City, destinationCity: City, price: Int) {
        self.destinationCity = destinationCity
        self.departureCity = departureCity
        self.price = price
    }
    
    func buyTickets() throws -> String{
        guard departureCity != City.omsk else {
            throw Reject.fromOmsk
//            return "You can't leave Omsk"
        }
        
        guard price <= credit else {
            throw Reject.money
//            return "Not enough money"
        }
        
        guard departureCity != destinationCity else {
            throw Reject.youAreHere
//            return "You are at \(departureCity.raw()) yet"
        }
        
        guard price != 0 else {
            throw Reject.priceZero
//            return "Now, it's impossible"
        }
        
        credit = credit - price
        geolocation = destinationCity.raw()
        return "You in \(geolocation) now"
    }
}

var trip1 = AviaTickets(departureCity: .voronezh, destinationCity: .moscow, price: 1000)
var trip2 = AviaTickets(departureCity: .voronezh, destinationCity: .moscow, price: 1000)
var trip3 = AviaTickets(departureCity: .voronezh, destinationCity: .omsk, price: 0)
var trip4 = AviaTickets(departureCity: .omsk, destinationCity: .moscow, price: 10000)
var trip5 = AviaTickets(departureCity: .moscow, destinationCity: .moscow, price: 90)

do {
    try trip1.buyTickets()
    print("From \(trip1.departureCity.raw()) to \(trip1.destinationCity.raw()) OK")
    try trip2.buyTickets()
    print("From \(trip2.departureCity.raw()) to \(trip2.destinationCity.raw()) OK")
    try trip3.buyTickets()
    print("From \(trip3.departureCity.raw()) to \(trip3.destinationCity.raw()) OK")
    try trip4.buyTickets()
    print("From \(trip4.departureCity.raw()) to \(trip4.destinationCity.raw()) OK")
    try trip5.buyTickets()
    print("From \(trip5.departureCity.raw()) to \(trip5.destinationCity.raw()) OK")
} catch Reject.fromOmsk {
    print(Reject.fromOmsk.raw())
} catch Reject.money {
    print(Reject.money.raw())
} catch Reject.youAreHere {
    print(Reject.youAreHere.raw())
} catch Reject.priceZero {
    print(Reject.priceZero.raw())
}

//
//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
//
