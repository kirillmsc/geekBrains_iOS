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

print("Enter your credit")
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
    
    func buyTickets() -> String{
        guard departureCity != City.omsk else {
            return "You can't leave Omsk"
        }
        
        guard price <= credit else {
            return "Not enough money"
        }
        
        guard departureCity != destinationCity else {
            return "You are at \(departureCity.raw()) yet"
        }
        
        guard price != 0 else {
            return "Now, it's impossible"
        }
        
        credit = credit - price
        geolocation = destinationCity.raw()
        return "You in \(geolocation) now"
    }
}


var trip1 = AviaTickets(departureCity: .omsk, destinationCity: .moscow, price: 10000)
var trip2 = AviaTickets(departureCity: .moscow, destinationCity: .toronto, price: 15000)
var trip3 = AviaTickets(departureCity: .voronezh, destinationCity: .moscow, price: 1000)
var trip4 = AviaTickets(departureCity: .moscow, destinationCity: .moscow, price: 90)
var trip5 = AviaTickets(departureCity: .voronezh, destinationCity: .omsk, price: 0)

print(trip1.buyTickets())
print(trip2.buyTickets())
print(trip3.buyTickets())
print(trip4.buyTickets())
print(trip5.buyTickets())

//class Tickets{
//    var plains = [
//        "Moscow"
//        "Voronez"
//        "Omsk"
//        "Toronto"
//    ]
//}
//
//do {
//    let trip1 = try AviaTickets(departureCity: .omsk, destinationCity: .moscow, price: 10000)
//    let trip2 = try AviaTickets(departureCity: .moscow, destinationCity: .toronto, price: 15000)
//    let trip3 = try AviaTickets(departureCity: .voronezh, destinationCity: .moscow, price: 1000)
//    let trip4 = try AviaTickets(departureCity: .moscow, destinationCity: .moscow, price: 90)
//    let trip5 = try AviaTickets(departureCity: .voronezh, destinationCity: .omsk, price: 0)
//} catch

//
//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
//
