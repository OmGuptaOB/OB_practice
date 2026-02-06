//
//  Sets.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//

import Foundation

class Sets{
    
    
    //2 ways to define set
    var set1 : Set<Int> = [1,2,3,4,5]
    var set2 = Set(["a","b","c"])
    var setstr = Set(["a","d","e","f"])
    var set3 = Set([2,3,4,6,7,8,3,5,4])
    
    //type safe so only 1 types of data
//    let set3 = Set(["a","b","c",1,2,4]) //Type of expression is ambiguous without a type annotation
    
    func setOps(){
        print("set1",set1)
        print("\n set3",set3)
        print("first element ",set1.first)
        set1.insert(6)
        set1.remove(7)
        
        var set4=set1.union(set3)
        print("\n set4 union of set 1 and set 3",set4.sorted())
        
        var set5=set1.intersection(set3)
        print("\n set5 intersection of set 1 and set 3",set5.sorted())
        
        var set6=set1.subtracting(set3)
           print("\n set6 substraction of set 1 and set 3",set6.sorted())
        
        var set10=set1.isSubset(of: set3)
           print("\n set10 checkes if set1 is subset of set 3",set10)
        
        
        //str set
        print("\n set1",set2)
        print("\n set3",setstr)
        
        var set7=set2.union(setstr)
        print("\n set7 union of set 2 and setstr ",set7.sorted())
        
        var set8=set2.intersection(setstr)
        print("\n set8 intersection of set 2 and setstr ",set8.sorted())
        
        var set9=set2.subtracting(setstr)
        print("\n set9 subtraction of set 2 and setstr ",set9.sorted())
        var set91=set2.symmetricDifference(setstr)
        print("\n set91 symmetricDifference of set 2 and setstr ",set91.sorted())
        
        
        print("\n set9134 is of setstr that statement is  ")
        var set9134=set2.isDisjoint(with: setstr)
        
        
//        print(set2.isSubset(setstr))
        set2.removeAll()
        print("\n after removin all , set2 : ",set2)
        
    }
   
    func setof(){
        
        var setofarr : Set<[Int?]?> = [[0, 0, 1],[1, 1, 0],[0, 0, 1]]
        var setofset : Set<Set<Int>> = [[0, 0, 1],[1, 1, 0],[0, 0, 1]]
        for i in setofarr{
            if var setofarr = i{
                let nwerr = setofarr.compactMap{$0}
                print(nwerr)
            }
        }
        
        
        //set of tuples
        
        struct Point: Hashable {
            let x: Int
            let y: Int
        }

        let points: Set<Point> = [
            Point(x: 0, y: 0),
            Point(x: 1, y: 2),
            Point(x: 3, y: 4)
        ]

        
        //set of dictionary
        
        var userSettings: Set<[String: Int]> = [
            ["Theme": 1, "FontSize": 12],
            ["Theme": 2, "FontSize": 14]
        ]

        print(setstr.removeFirst()) //unordered so random
        print("set contains: \(setstr.contains("a"))")
        

        
    }
    
    
}
