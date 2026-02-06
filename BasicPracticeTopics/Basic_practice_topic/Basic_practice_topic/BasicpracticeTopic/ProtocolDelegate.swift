//
//  ProtocolDelegate.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 28/01/26.
//

import Foundation


    
   @objc protocol SportsTeam{
       @objc optional func playing()
        func bringequipment()
    }
    protocol orgTeam{
        func organising()
        func bringequipment()
    }
    
    class Student{
        var id : Int
        var name : String
        
        init(id : Int, name : String){
            self.name = name
            self.id = id
        }
    }
    
    class StudyGroup :  orgTeam{
        func bringequipment() {
            print("\(groupName) bringing equipment")
        }
        
        var groupName : String?
        func organising() {
                print("\(groupName) student are in organizing team ")
        }
    }
    class SportsGroup :  orgTeam,SportsTeam{
        var groupName : String?
        func organising() {
            print("\(groupName) also organising")
        }
        
        func bringequipment() {
            print("\(groupName) this team will bring equipment")
        }
        
        
        
        func volunteer(_ volunteerName : orgTeam & SportsTeam){
            volunteerName.bringequipment()
            volunteerName.organising()
//            volunteerName.playing()
        }
    }
    
    protocol IdentifiableUser {
        var id: String { get }
    }

    protocol AuthenticatableUser : IdentifiableUser {
        func login()
        func logout()
    }
    
    protocol AdminUser: AuthenticatableUser {
        func addUser()
        func removeUser()
    }
    
    extension AuthenticatableUser {
        
        func login() {
            print("\(id) logged in")
        }

        func logout() {
            print("\(id) logged out")
        }
    }

    struct AppUser: AuthenticatableUser {
        let id: String
    }

struct Admin: AdminUser {
    let id: String

    func addUser() {
        print("User added")
    }

    func removeUser() {
        print("User removed")
    }
}


protocol MusicplayerDelegate {
    func songDidFinish()
}

class Musicplayer{
    var musicDelegate : MusicplayerDelegate?
    
    
    
    func play(song: String){
        print("now playing \(song)...")
        musicDelegate?.songDidFinish()
    }
}

class NowPlayingScreen : MusicplayerDelegate{
    func songDidFinish() {
        print("finished playing the song")
    }
    
    
}
