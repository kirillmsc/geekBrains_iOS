//
//  main.swift
//  lesson_2
//
//  Created by k.kochemasov on 01/03/2019.
//  Copyright © 2019 k.kochemasov. All rights reserved.
//

import Foundation
//
print("Написать функцию, которая определяет, четное число или нет.")
print("Введите число для проверки на четность")
print(numEven(number: Int(readLine()!)!))
//
//
print("Написать функцию, которая определяет, делится ли число без остатка на 3.")
print("Введите число:")
print(numDivide(number: Int(readLine()!)!))
//
//
print("Создать возрастающий массив из 100 чисел.")
print("Нажмите Enter для продолжения")
readLine()
print(Array(0...100))
//
//
print("Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")
print("Нажмите Enter для продолжения")
readLine()
var hunArray = Array(0...100)
var index = 0
for i in hunArray where (numEven(number: i)) || (numDivide(number: i)){
    hunArray.remove(at: (hunArray.index(of: i)!))
}
print(hunArray)
//
//
print("Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.")
print("Нажмите Enter для продолжения")
readLine()
print(fibNum(number: 100))
//
//
//print("6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
var numArray = Array(2...545)
for i in numArray {
    for n in numArray where i != n {
        if (simpl(numberF: i, numberS: n)) {
            numArray.remove(at: (numArray.index(of: n)!))
        }
    }
}
print(numArray)
