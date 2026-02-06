//
//  Dictionary.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 08/01/26.
//
import Foundation

class Dictionary{
//    all keys and vales type should be same int to int and string to string
    var ages: [String] = ["om","ganesh",""]
    var ges2: [Int] = [1,2,3]
    var dictionary = ["A": 1, "B": 2 ,"C" : 3]
   
    var shoppingList = ["Eggs", "Milk",""]

    
    func dictionaryOps(){
        
        
        
        //        let keys = dictionary.keys[0..<1]
        
        // Line A
        //        let bal = dictionary["B"]
        let value = dictionary["C"]
        
        // Line B
        //        let firstKey = keys
        //        print("total members : ",dictionary.keys)
        //        print(value)
        //        print(firstKey)
        //        print("all the members name ",ages.keys)
        //        print("all age ",ages.values)
        //        print("if any thing is empty ",ages.isEmpty)
        
        print(dictionary.isEmpty)
        print(dictionary.count)
        
        print("capacty of dictionary is : \(dictionary.capacity)")
        
        print("item a is at he indx : \(dictionary.index(forKey: "A"))")
        
        print("\n the keys and values are : ")
        for i in dictionary{
            print(i)
        }
        
        print("first key is : \(dictionary.first?.key ?? "") this can be random ")
        
        print("dictionary random element is : \(dictionary.randomElement()!)")
        
        print("the updated value for key C is : \(dictionary.updateValue(100, forKey: "C")!)")
        
        
        print("\n filtering the dictionary :  \(dictionary.filter{$0.value > 1})")
        
        
        
        let descriptions = dictionary.map { (key, value) in
            return "\(key) has value  \(value)"
        }
        print(descriptions)
        
        let scores = ["Alex": "90", "Bob": "Invalid", "Charlie": "85"]
        
        let validScores = scores.compactMap { (name, scoreString) in
            Int(scoreString)
        }
        
        print(validScores)
        
        let userTags = ["Admin": ["Security", "Logs"], "Guest": ["View"]]
      
        let allTags = userTags.flatMap { $0.value }
       
        print(allTags)
        
    }
    
    
    func dictof(){
        // A fridge where each shelf (key) has an array of items
        var fridge: [String: [String?]?] = [
            "Top Shelf": ["Milk", nil, "Eggs"],
            "Door": ["Ketchup", "Mustard"]
        ]

        // Adding an item to the "Door" array
        fridge["Door"] = ((fridge["Door"] ?? []) ?? []) + ["Mayo"]

        
        fridge["fruit basket"] = ["apples", "bananas", "oranges"]
        
        for (place,things) in fridge{
            if let things = things{
                let txleanthings = things.compactMap{$0}
                print("things in \(place) are \(txleanthings)")
              
            }
        }
        
        // User locations: Key is Username, Value is a Tuple (Lat, Lon)
        var userLocations: [String: (lat: Double?, lon: Double)?] = [
            "Alex": (40.7, -74.0),
            "Jordan": nil // We know the user, but don't have their location
        ]

        userLocations["Om"] = (32.6514, -161.4333)
        userLocations["rahul"] = (nil, -161.4333)
        
        // Accessing:
        if let coords = userLocations["rahul"] {
            print("rahul is at \(coords?.lat ?? 0) to \(coords?.lon ?? 0)")
        }
        
        
        //dict of dict
        
        // Localization data: Language -> (Word -> Translation)
        var translations: [String: [String: Any]?] = [
            "Spanish": ["Hello": "Hola", "Bye": "Adiós"],
            "French": nil // We plan to support French, but have no data yet
        ]

        // Accessing a nested value
        let greeting = translations["Spanish"]??["Hello"] // Optional("Hola")
    }
    
    func dictsize(){
        var fruits = ["A": "Apple", "B": "Banana"]
        
//        print(fruits.index(forKey: "A"))
        let indexA = fruits.index(forKey: "A")! // Valid index
        print(indexA)
       
//        for i in 1...1000 { fruits["\(i)"] = "Value" }
//        print(fruits)
//       
//         print(fruits[indexA]) // This might CRASH or give wrong data.
    }
}
