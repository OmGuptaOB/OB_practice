//
//  Functions.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 15/01/26.
//

import Foundation

class Functions {
    func greet(_ person: String, _ alreadyGreeted :Bool) {
        if alreadyGreeted {
            print("Hello,again \(person)!")

        }else{
            
            print("Hello, \(person)!")
        }

         
    }
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty{
            return nil
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    func variadic(nums: Double...){
        var total :Double = 0
        for num in nums {
            total += num
        }
        
        print("avg of the nums is \(total/Double(nums.count))")
    }
  
    
    

    
}




