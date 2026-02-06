//
//  Array.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 07/01/26.
//



class MyArray{
    
    var oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15, 20]
    let oddNumbers1 = [14, 30, 17, 19, 80]
//    var arrempty = [Int] = []
    
    var streets = ["Albemarle", "Brandywine", "Chesapeake"]

    func arraymethods(){
        
        var doubleArray = [1, 2, 3, nil, 2]
        
        print("array is empty it is  a : \(doubleArray.isEmpty) statement ")
        print("total streets count is :\(streets.count)")
        
        
        var mapi = oddNumbers.first(where: {$0 > 20})
        print("here\(mapi)")
        
        
        //check
        print(oddNumbers[0], oddNumbers[3], separator: ", ")
        
        print("first elements of array is : \(oddNumbers.first)")
        print("last elements of array is : \(oddNumbers.last)")
        print("random element from strrets array is : \(streets.randomElement())")
        
        print("check if array contains 13 or not : \(oddNumbers.contains(13))")
        
        print("min and max of oddnumbers \(oddNumbers.min() ?? 0) and \(oddNumbers.max() ?? 0)") //returns optional

        print("array without first element is : \(oddNumbers.dropFirst())")
        print("array without last element is : \(oddNumbers.dropLast())")
        
        var sortedarr = oddNumbers.sorted()
        print("sorted array using sorted : \(sortedarr)")
        streets.sort()
        print("sorted streets array using sort  : \(streets)")
        
        print("end index of array oddnumbers is :\(oddNumbers.endIndex)")
    
        
        // adding elements
        
        streets.append("wall street") //end
        streets+=["star walk","new street"]
//        streets.append(contentsOf: ["star walk","new street"]) //end
        oddNumbers+=[200,300]
        
        streets.insert("vesuvio", at: 4) // middle expensive
        
        
        //transforming an array
        
        let squar = oddNumbers.map { $0 * $0 }
        print("squar of odd numbers is : \(squar)")
        
       
        let doublearr  = doubleArray.compactMap{ $0 }.map { Double($0) }
        print(" array using compactmap is : \(doublearr)")
        
        
        let arrmap = doublearr.map{[$0]}
//        print(arrmap)
        let flatmaparr = arrmap.flatMap{ $0 }
        print("flat mapped array from \(arrmap) is : \(flatmaparr)")
        
        
        let newAddress = streets.joined(separator: ",")
        print("new address is : \(newAddress)")
        
        let splitaddress = newAddress.split(separator: " - ")
        print("split address is : \(newAddress)")
        
        if oddNumbers == squar{
            print("they are equal")
        }else{
            print("not equal")
        }
        
        streets.remove(at: 3)
        streets.removeLast()
        streets.removeFirst()
        oddNumbers.popLast()
//        streets.removeAll()
        
        //update
        print("oddNumbers before to \(oddNumbers)")
        if let idx = oddNumbers.firstIndex(of: 7){
            oddNumbers.insert(contentsOf: oddNumbers1, at: idx + 1)
            print("oddNumbers updated to \(oddNumbers)")
        }
        
        if let index = streets.firstIndex(of: "Chesapeake") {
            streets[index] = "vesu bhartahana"
            print("street updated to \(streets[index])")
        }
        
        if let index = oddNumbers.lastIndex(of: 5) {
            oddNumbers[index] = 9
            print("numbers updated to \(oddNumbers[index])")
        }
        
        
        
      //copy array
        var numbersCopy = oddNumbers
        oddNumbers[0] = 100
        print(oddNumbers)
        // Prints "[100, 2, ....
        print(numbersCopy)
        
        // Using the shorthand [Int] is usually safer and harder to mess up
        let arrempty = [Int](repeating: 1, count: 5)
        print(arrempty)
        
        
        print(streets)
    }
    
    func arrayof(){
        var sudent : [[String:Int?]] = [["id":1,"grade":100],["id":2,"grade":nil]]
        print("\n array of dictionary : \(sudent)")
        
       if let studentgrade = sudent[1]["grade"] {
           print("grade is \(String(describing: studentgrade))")
        }
        
        var arrtup : [(Id:Int,name:String?)] = [(1,"one"),(2,"two"),(3,nil)]
        print("array of tuples : \(arrtup)")
        
        for nam in arrtup {
            let student = nam.name ?? "no name available"
            print("\(student) with \(nam.Id) ")
        }
        
        var arrSet : [Set<Int?>?] = [[1,2,3],[nil,5,6],[7,8,9],nil]
        
        if let mutable = arrSet[1]{
            print(arrSet[0]!)
            let maped = mutable.compactMap{$0}
            print(maped)
            print(arrSet[1]?.insert(30))
            print(arrSet)
        }
        
        
//        array of array
        
        
//        var ararr : [[Int]?] = [[1,2,3],[nil,5,6],[7,8,9],nil]
        
    }
    
//    class IntegerReference {
//        var value = 10
    
   
//    }
    

    let arr1 : [Int] = []
    let arr2 = [Int]()
    var arr = Array<Int>()
//    let arr3 : Int = Array(repeating: <#T##String#>, count: <#T##Int#>)
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    var fruits = ["apple", "banana", "orange",14]
    //    Heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional
   
//    var currentStatus: (Int, String)
//    var intvar: Int
//    var arrint : [Int] = []
//    var Arry = [Int]()
//    
//    
//    var strArray = ["a","b","c"]
//    
//    var dictarr = [[1:"one",2:"two"],[3:"three",4:"four"]]
////    var Dictarr: [String:Int]
////    var dictarr : [[String:Int]] = []
//    var fruits   = ["apple", "banana", "orange"]
//    
//    
//    var firstarr = [1,2,3,5]
//    func maping(){
//        
//        var first = firstarr[0]
//        var first3 = firstarr.first
//        print(first)
//
//        print(first3)
//        
//        firstarr.insert(10, at: 10)
//        firstarr.remove(at: 0)
//        firstarr.[0...1]
//       
////        for (index , value) in fruits.enumerated(){
////            print("index \(index) is \(value)")
////        }
//    }
//    
//    func PropertiesArry(){
//        
//        
//  
//        print(fruits.count)
//        
//        print(fruits.append("fruit item"))
//        fruits += ["mango", "pineapple"]
//       
//        
//        fruits[2...4] = ["grape", "cherry", "pineapple"]
//        print(fruits.isEmpty)
//        print(fruits)
//        
//        print(fruits.first)
//        
//        print(fruits.last)
//        
//        print("\n Element at index 2 is ", fruits[2])
//        
//        fruits.insert("\n papaya", at: 1)
//        print("After insert ", fruits)
//        
//        print("\n Looping through array ")
//        for fruit in fruits {
//            print(fruit)
//        }
//        
//        fruits.remove(at: 2)
//        print("\n after removing",fruits)
//        
//        fruits.sort()
//        print("\n after sorting",fruits)
//       
//        
//    }
    
    
    
   
}



