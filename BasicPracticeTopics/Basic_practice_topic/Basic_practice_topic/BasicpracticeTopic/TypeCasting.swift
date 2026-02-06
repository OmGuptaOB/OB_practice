//
//  TypeCasting.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 19/01/26.
//

import Foundation

class TypeCasting {

    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
        
        
    }

    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
        
         func direct(){
            print("Director \(director) is directing a the movie \(name)")
        }
    }

    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
        
        func song(){
            print("song \(name) music is playing , music by \(artist) ")
        }
    }
    class Visual {
        var name : String
        init(name: String) {
            self.name = name
        }
    }
    
    func typearray(){
        var arr : [Any] = [Movie(name: "sdf", director: "adad"),Visual(name: "om"),Song(name: "sdf", artist: "adad")]
    }

    static func test() {
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley"),
        ]
        var movieCount = 0
        var songCount = 0
        var mediaCount = 0
        for item in library {
            if let movie = item as? Movie {
                movieCount += 1
                print("Movie: \(movie.name), dir. \(movie.director)")
            }
            if let song = item as? Song {
                songCount += 1
                print("Song: \(song.name), by \(song.artist)")
            }
            if let Mitem = item as? MediaItem {
                mediaCount += 1
            }

        }

        print(
            "movie count \(movieCount) , song count \(songCount) , media count \(mediaCount)"
        )
    }

    static func typecheeck() {
        var things: [Any] = []

        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({ (name: String) -> String in "Hello, \(name)" })

        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                print("a movie called \(movie.name), dir. \(movie.director)")
            case let stringConverter as (String) -> String:
                print(stringConverter("Michael"))
            default:
                print("something else")
            }
        }

    }
    
    
    
    

}
