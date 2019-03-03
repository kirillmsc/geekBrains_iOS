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
    var fibArray = [Decimal]()
    var f1: Decimal = 0
    var f2: Decimal = 1
    var f3: Decimal
    var i = 1
    while i <= number{
        f3 = f1 + f2
        fibArray.append(f3)
        f1 = f2
        f2 = f3
        i += 1
    }
    return fibArray
}
