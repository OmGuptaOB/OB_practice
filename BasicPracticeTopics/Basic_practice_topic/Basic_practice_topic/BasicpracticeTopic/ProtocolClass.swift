//
//  ProtocolClass.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 20/01/26.
//

import Foundation

protocol FullyNamed {
    var fullName: String { get }
    func newName() -> String
    init(name: String)
}

class Starship: FullyNamed {
    required init(name: String) {
        self.name = name
    }
    
    func newName() -> String {
        self.name + " 1000"
    }
    
    var prefix: String?
    var name: String

    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }

    var fullName: String {
        return (prefix != nil ? prefix! + "  " : "Master ") + name
    }
}

protocol ElectricEquipment{
    var voltage:Int? {get set}
    func start()
    func stop()
}

protocol WaterElectricEquipment{
    var voltage:Int? {get set}
    var waterLevel : Int? {get set}
    func start()
    func stop()
}

class Microwave:ElectricEquipment{
    var voltage:Int?
    
    init?(_voltage:Int){
        guard 50...100 ~= _voltage else {
            debugPrint("invalid voltage")
            return nil
        }
        voltage = _voltage
    }
    
    func start(){
        print("microwave started")
    }
    
    func stop(){
        print("microwave stopped")
    }
}

class Dishwasher : WaterElectricEquipment{
    
    var voltage:Int?
    var waterLevel:Int?
    
    init?(_voltage:Int, _waterLevel :Int){
        guard 200...220 ~= _voltage else {
            debugPrint("invalid voltage level should be 200-220")
            return nil
        }
        guard 3...5 ~= _waterLevel else {
            debugPrint("invalid water level should be 3-5")
            return nil
        }
        
        voltage = _voltage
        waterLevel = _waterLevel
    }
    
    func start(){
         print("Dishwasher started")
    }
    func stop(){
         print("Dishwasher stopped")
    }
}

class Kitchen {
    var microWaeve:Microwave?
    var dishwasher:Dishwasher?
    
   
}

