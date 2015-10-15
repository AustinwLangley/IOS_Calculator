//
//  Calculator.swift
//  Calculator
//
//  Created by AL on 7/29/15.
//  Copyright (c) 2015 Mob3. All rights reserved.
//

import Foundation

class Calculator {
    
    var inputArray: [String] = []
    var xCounter = 0
    var dCounter = 0
    var pCounter = 0
    var mCounter = 0
    
    func insertIntoArray(input: String){
        inputArray.append(input)
        print("The Array: \(inputArray)")
        // validation
    }
    
    func operationCounter (operation: String) -> String {
        if operation == "×"{
            xCounter++
            print("x counter is: \(xCounter)")
            print("d counter is: \(dCounter)")
            print("p counter is: \(pCounter)")
            print("m counter is: \(mCounter)")
            
            if (xCounter == 1 && pCounter == 1) || (xCounter == 1 && mCounter == 1) {
                return inputArray[2]
            }
            
            if xCounter == 2 && pCounter == 1 {
                let firstOperand = NSNumberFormatter().numberFromString(inputArray[4])!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                let firstOperation = firstOperand * secondOperand
                xCounter = 1
                inputArray = [inputArray[0], inputArray[1], "\(firstOperation)", inputArray[3]]
                print("Input array is now: \(inputArray)")
                return "\(firstOperation)"
            }
            
            if xCounter == 2 && mCounter == 1 {
                let firstOperand = NSNumberFormatter().numberFromString(inputArray[4])!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                let firstOperation = firstOperand * secondOperand
                xCounter = 1
                inputArray = [inputArray[0], inputArray[1], "\(firstOperation)", inputArray[3]]
                print("Input array is now: \(inputArray)")
                return "\(firstOperation)"
            }
            
            if xCounter == 2 {
                if pCounter == 1 {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand + secondOperand
                    pCounter = 1
                    inputArray = []
                    inputArray = ["\(firstOperation)", "×" ]
                    print("input array after counter is: \(inputArray)")
                    return "\(firstOperation)"
                }
                if mCounter == 1 {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand + secondOperand
                    mCounter = 1
                    inputArray = []
                    inputArray = ["\(firstOperation)", "×" ]
                    print("input array after counter is: \(inputArray)")
                    return "\(firstOperation)"
                } else {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand * secondOperand
                    xCounter = 1
                    inputArray = []
                    inputArray = ["\(firstOperation)", "×" ]
                    print("input array after counter is: \(inputArray)")
                    return "\(firstOperation)"
                }
            }
        }
        if operation == "÷"{
            dCounter++
            print("x counter is: \(xCounter)")
            print("d counter is: \(dCounter)")
            print("p counter is: \(pCounter)")
            print("m counter is: \(mCounter)")
            
            if dCounter == 1 && pCounter == 1 || (dCounter == 1 && mCounter == 1){
                return inputArray[2]
            }
            
            if dCounter == 2 && pCounter == 1 {
                let firstOperand = NSNumberFormatter().numberFromString(inputArray[4])!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                let firstOperation = secondOperand / firstOperand
                dCounter = 1
                inputArray = [inputArray[0], inputArray[1], "\(firstOperation)", inputArray[3]]
                print("Input array is now: \(inputArray)")
                return "\(firstOperation)"
            }
            
            if dCounter == 2 && mCounter == 1 {
                let firstOperand = NSNumberFormatter().numberFromString(inputArray[4])!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                let firstOperation = secondOperand / firstOperand
                dCounter = 1
                inputArray = [inputArray[0], inputArray[1], "\(firstOperation)", inputArray[3]]
                print("Input array is now: \(inputArray)")
                return "\(firstOperation)"
            }

            if dCounter == 2 {
                if pCounter == 1 {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand + secondOperand
                    pCounter = 1
                    inputArray = []
                    inputArray = ["\(firstOperation)", "÷" ]
                    print("input array after counter is: \(inputArray)")
                    return "\(firstOperation)"
                }
                if mCounter == 1 {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand + secondOperand
                    mCounter = 1
                    inputArray = []
                    inputArray = ["\(firstOperation)", "÷" ]
                    print("input array after counter is: \(inputArray)")
                    return "\(firstOperation)"
                } else {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand / secondOperand
                    dCounter = 1
                    inputArray = []
                    inputArray = ["\(firstOperation)", "÷" ]
                    print("input array after counter is: \(inputArray)")
                    return "\(firstOperation)"
                }
            }
        }
        if operation == "+"{
            pCounter++
            if pCounter == 2 {
                let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                let firstOperation = firstOperand + secondOperand
                pCounter = 1
                inputArray = []
                inputArray = ["\(firstOperation)", "+" ]
                print("input array after counter is: \(inputArray)")
                return "\(firstOperation)"
            }
        }
        if operation == "−"{
            mCounter++
            if mCounter == 2 {
                let firstOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                let firstOperation = firstOperand - secondOperand
                mCounter = 1
                inputArray = []
                inputArray = ["\(firstOperation)", "−" ]
                print("input array after counter is: \(inputArray)")
                return "\(firstOperation)"
            }
        }
        return inputArray[0]
    }
    
    func performCalculation() -> String {
        if inputArray.count > 3 {
            if inputArray[3] == "×" {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray.removeLast())!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = firstOperand * secondOperand
            
                if inputArray[1] == "+" {
                    print("I multiplied then added")
                    let thirdOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let answer = firstOperation + thirdOperand
                    inputArray = []
                    print("Input array is now: \(inputArray)")
                    return "\(answer)"
                }
            
                if inputArray[1] == "−" {
                    print("I multiplied then subtracted")
                    let thirdOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let answer = thirdOperand - firstOperation
                    inputArray = []
                    print("Input array is now: \(inputArray)")
                    return "\(answer)"
                }
            }
            if inputArray[3] == "÷" {
                    let firstOperand = NSNumberFormatter().numberFromString(inputArray.removeLast())!.doubleValue
                    let secondOperand = NSNumberFormatter().numberFromString(inputArray[2])!.doubleValue
                    let firstOperation = secondOperand / firstOperand
                
                if inputArray[1] == "+" {
                    print("I multiplied then added")
                    let thirdOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let answer = firstOperation + thirdOperand
                    inputArray = []
                    print("Input array is now: \(inputArray)")
                    return "\(answer)"
                }
                
                if inputArray[1] == "−" {
                    print("I multiplied then subtracted")
                    let thirdOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                    let answer = thirdOperand - firstOperation
                    inputArray = []
                    print("Input array is now: \(inputArray)")
                    return "\(answer)"
                }
            }
        }
        else {
            
        if inputArray[1] == "×"{
            if inputArray.count >= 2 {
                print("I multiplied")
                let firstOperand = NSNumberFormatter().numberFromString(inputArray.removeLast())!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                let answer = firstOperand * secondOperand
                inputArray = []
                print("Input array is now: \(inputArray)")
                return "\(answer)"
            }
        }
        if inputArray[1] == "÷" {
            if inputArray.count >= 2 {
                print("I divided")
                let firstOperand = NSNumberFormatter().numberFromString(inputArray.removeLast())!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                let answer = secondOperand / firstOperand
                inputArray = []
                print("Input array is now: \(inputArray)")
                return "\(answer)"
            }
         }
        if inputArray[1] == "+"{
            if inputArray.count >= 2 {
                print("I added")
                let firstOperand = NSNumberFormatter().numberFromString(inputArray.removeLast())!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                let answer = firstOperand + secondOperand
                inputArray = []
                print("Input array is now: \(inputArray)")
                return "\(answer)"
            }
        }
        if inputArray[1] == "−" {
            if inputArray.count >= 2 {
                print("I subtracted")
                let firstOperand = NSNumberFormatter().numberFromString(inputArray.removeLast())!.doubleValue
                let secondOperand = NSNumberFormatter().numberFromString(inputArray[0])!.doubleValue
                let answer = secondOperand - firstOperand
                inputArray = []
                print("Input array is now: \(inputArray)")
                return "\(answer)"
            }
        }
            
        }
        return "error"
    }
    
    func percentCalculation(percentValue: String) -> String{
        let firstOperand = NSNumberFormatter().numberFromString(percentValue)!.doubleValue
        return "\(firstOperand / 100)"
    }
    
    func negative(negValue: String) -> String{
        let firstOperand = NSNumberFormatter().numberFromString(negValue)!.doubleValue
        let result = -1.0 * firstOperand
        return "\(result)"
    }
    
    func allClear() {
        inputArray = []
        resetCounters()
    }
    
    func resetCounters(){
        xCounter = 0
        dCounter = 0
        pCounter = 0
        mCounter = 0
    }
    
}