//
//  funcs.swift
//  lesson_2
//
//  Created by k.kochemasov on 01/03/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//

import Foundation

func numEven(number: Int) -> Bool {
    let res = (number % 2 == 0) ? true : false
    return res
}

func numDivide(number: Int) -> Bool {
    let res = (number % 3 == 0) ? true : false
    return res
}


func fibNum(number: Int) -> Array<Any>{
    var fibArray = [Double]()
    var f1: Double = 0
    var f2: Double = 1
    var f3: Double
    fibArray.append(f2)
    var i = 1
    while i <= number-1{
        f3 = f1 + f2
        fibArray.append(f3)
        f1 = f2
        f2 = f3
        i += 1
    }
    return fibArray
}

func simpl(numberF: Int, numberS: Int) -> Bool {
    let res = (numberS % numberF == 0) ? true : false
    return res
}
