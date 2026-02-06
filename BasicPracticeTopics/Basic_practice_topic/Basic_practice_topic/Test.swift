//
//  Test.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 24/01/26.
//
import TestFramework

class Usercls : UserManager{
   
    func printname(){
        print(appName)
    }
    
    func cretest(){
        let manager = UserManager()

//               manager.login(username: "Om")       // ✅ open
//               manager.login(username: "ravi")       // ✅ open
               print(manager.appName)              // ✅ public

//                manager.usersCount              /* ❌ internal*/
//        print(manager.usersCount)
//        manager.logout(username: "Om")
//        manager.logout(username: "ravi")
//        print(manager.usersCount)
//        big.prinname()
        /*❌ internal*/
                /*manager.validate("Om")*/           /*❌ private*/
                /*manager.clearCache()*/             /*❌ fileprivate*/
        
        
        
        let service = MathService()
        
        print(service.add(2, 3))        // ✅ public
        
        print(service.multiply(2, 3))
       
            
//                let nai = AnimalFramework()
//                
//               let sound = nai.animalSound()
//                print(sound)
    }
}




