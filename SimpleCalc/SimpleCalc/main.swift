//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
  public func calculate(_ args: [String]) -> Int {
    print(args)
    switch args[args.count - 1] {
    case "count": // return count
      return args.count - 1
    case "avg": // return average
      if(args.count - 1 > 0) {
        var sum : Int = 0
        for value in args {
          if(value != "avg") {
            sum += Int(value)!
          }
        }
        return sum / (args.count - 1)
      }
      return 0
    case "fact": // return factorial
      var total : Int = 0;
      if(args.count > 1) {
        if(Int(args[0])! > 1) {
          total = 1
          for value in 2...Int(args[0])! {
            total *= value
          }
        } else {
          return 1
        }
      }
      return total
    default: // non-special operation
      let leftOperand : Int = Int(args[0])!
      let operation : String = args[1]
      let rightOperand : Int = Int(args[2])!
      switch operation {
      case "+":
        return leftOperand + rightOperand
      case "-":
        return leftOperand - rightOperand
      case "/":
        return leftOperand / rightOperand
      case "*":
        return leftOperand * rightOperand
      case "%":
        return leftOperand % rightOperand
      default:
        return 0
      }
    }
  }
  
  public func calculate(_ arg: String) -> Int {
    return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
  }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

