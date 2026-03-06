//
//  ViewController.swift
//  Basic_practice_topic
//
//  Created by OBMac-13 on 07/01/26.
//

import UIKit
import TestFramework

class ViewController: UIViewController {

    @IBAction func btnclick(_ sender: Any) {
        lbl1.text = "Hello, World!"
//        print("check check")
    }
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var btnconsole: UIButton!
    
    
  
    
    var arr : [[Int:String]] = [[1:"one"],[2:"two"]]
    var dict : [[Int]:[String]] = [[1,2,3]:["one","two","three"], [2]:["two" ]]
    
    var arrint : [Int] = [1,2,3]
    
    var arrmix : [Any] = [1,"two",true]
    
    let yu : [Int] = []
    let y2 = [Int]()
//    let y3 : Array<Int>()
    
    override func viewDidLoad(){
        
        //        opt2 = "Hello"
        var opt1: String?
        var opt2: String? = nil
        //        print("opt ?",opt1!)
        //        print("opt ?",opt2)
        
        var opt3: String!
        var opt4: String! = nil
        opt3 =  "Hello"
        //        print(opt3)
        //        print("opt !",opt3!.count)
        //        print("opt !",opt4?.count)
        
        var message: String? = "Hello"
        let upper = message?.uppercased()
        //        print("uppercased",upper!) // Optional("SWIFT")
        
        
        //        guard let value = opt3 else { return "no value" }
        //        switch opt3 {
        //    case .some(let value):
        //            print(value.count)
        //    case .none:
        //        print("nil val")
        //    }
        
        //        print(value.count)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        self.opt4 = self.opt3
        //        if let o2 = self.opt1 {
        //            self.opt2 = o2
        //        }
        //        self.opt2 = self.opt1
        // MARK: - Basic Variables & Constants
        
        let nameo = "Swift"
        // print(nameo.index(after: nameo.2))
        
        // Constants
        let accountObj = Constants()
        // accountObj.withdraw(amount: 200)
        
        var environment = "development"
        let maximumNumberOfLoginAttempts: Int
        // maximumNumberOfLoginAttempts has no value yet.
        
        if environment == "development" {
            maximumNumberOfLoginAttempts = 100
        } else {
            maximumNumberOfLoginAttempts = 10
        }
        
        // let maximumNumberOfLoginAttempts : Float = 1.12345612 // 1.12345
        // print(maximumNumberOfLoginAttempts)
        // print(Double(maximumNumberOfLoginAttempts))
        
        let num: Double = 1.123456001281738
        // print(Float(num))
        
        //        var x = 0.0, y = "hello", z = true
        
        // y = 34
        // print(x)
        // print(y)
        // print(z)
        
        var red, green, blue: Double
        red = 1.0
        var a34 = 10
        green = 2.5
        var zvsr = 10 + 2.5
        blue = 3.0
        
        let unt: UInt8 = 255
        // print(unt)
        
        // MARK: - Unicode & Identifiers
        
        let π = 3.14159
        let 你好 = "你好世界"
        let 🐶🐮 = "dogcow"
        
        let `$` = 12
        let `func` = 10
        
        let name = "om gupta"
        // name = "om"
        
        // print("om", "gupta", separator: "&")
        // print("om-", terminator: "")
        // print("gupta")
        
        // MARK: - Integer Types & Limits
        
        //        let a: Int8 = 127
        // let a : Int16 = 12345
        // print(Int8.min)
        // print(Int8.max)
        // print(Int16.min)
        // print(Int16.max)
        // print(Int32.min)
        // print(Int32.max)
        // print(Int64.min)
        // print(Int64.max)
        
        //        let value: UInt = 10
        // print(Float(value))
        
        let decimalInteger = 17
        let binaryInteger = 0b10001
        let binaryInteger2 = 0b11111
        let octalInteger = 0o20
        let hexadecimalInteger = 0x10
        
        // print(binaryInteger)
        // print(octalInteger)
        // print(hexadecimalInteger)
        
        // MARK: - Typealias
        
        typealias i8 = Int8
        var v1: i8 = 10
        
        let orangesAreOrange = true
        let turnipsAreDelicious = false
        
        if orangesAreOrange {
            // print("Mmm, tasty turnips!")
        } else {
            // print("Eww, turnips are horrible.")
        }
        
        // MARK: - Tuples
        
        let serverResponse = (404, "File Not Found")
        var currentStatus: (Int, String)
        
        currentStatus.1 = "OK"
        //        print(currentStatus.1)
        
        // MARK: - Optionals
        
        var opt: String?
        
        let optionOBJ = Optionals()
        
        let savedName: String? = nil
        let nameToDisplay = savedName ?? "Guest"
        // print(nameToDisplay)
        
        // MARK: - Arrays
        
        let objarr = MyArray()
        //         objarr.arraymethods()
        // objarr.arrayof()
        
        let u = Classes()
        // u.clsArray()
        
        // MARK: - Tuples (Custom)
        
        let objtuple = Tuples()
        // objtuple.tupleof()
        
        // MARK: - Sets
        
        let setobj = Sets()
        // setobj.setOps()
        
        // MARK: - Dictionary
        
        let dictobj = Dictionary()
        // dictobj.dictionaryOps()
        
        // MARK: - Control Flow
        
        let flowObj = ControlFlow()
        //         flowObj.flowops2()
        // flowObj.accesToLogin(role: "admin")
        
        // MARK: - Structures & Classes
        
        var user1 = StructuresClass.User(name: "Shubham")
        
        let vehicle = Vehicle(numberOfWheels: 4)
        //        vehicle.numberOfWheels = 4
        //        print("Vehicle: \(vehicle.numberOfWheels)")
        
        let bike = Bicycle()
        
        //        print(bike.numberOfWheels)
        
        //        let hover = hoverboard(color: "red")
        // print(hover.description)
        
        //        let namedMeat = Food()
        //        print(namedMeat.name)
        
        let recipie = RecipeIngredient(name: "dal bati", quantity: 2)
        //        print(recipie.country ?? "unknows")
        
        var breakfastList = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6)
        ]
        
        // MARK: - Failable Initializer Example
        
        //        var uer = User(name: "", age: -1)
        
        // MARK: - Deinitializers
        
        //        var dint = Deinitialize.FileLogger(fileName: "Epstine files")
        // print(dint.fileName)
        
        // MARK: - Functions
        var function = Functions()
        
        //        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        //            a = a + b
        //            b = a - b
        //            a = a - b
        //            print("value of a is \(a) and value of b is \(b)")
        //        }
        //        var a = 10
        //        var b = 20
        //        print("value of a is \(a) and value of b is \(b)")
        //        swapTwoInts(&a,&b)
        //        print("value of a is \(a) and value of b is \(b)")
        //        print(function.greet("alice", true))
        //        if let bound = function.minMax(array: [1,2,3,4,5,6,7,8,9,10,121,2,34,325,4534,635,745,856524,54,4534,5345345,45]){
        //            print("max from array \(bound.max) and min from array \(bound.min)")
        //        }
        
        //        Classes.clsarr()
        //        function.variadic(nums: 1.2,34.1,5.2,6.2)
        
        
        
        
        func addtoint(_ a : Int,_ b : Int)->Int{
            return a+b
        }
        func multitwoint(_ a : Int,_ b : Int)->Int{
            return a*b
        }
        
        //        var addtwonums  : ( Int, Int) -> Int = addtoint
        var addtwonums = multitwoint
        
        //        func mathfunc(_ twofunc : (Int,Int) -> Int, _ a : Int, _ b : Int){
        //            print("value of two nums \(twofunc(a,b))")
        //        }
        //        print(mathfunc(addtwonums, 10, 20))
        
        
        
        //        func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        //            func stepForward(_ input: Int) -> Int {
        //                return input + 1
        //            }
        //            func stepBackward(_ input: Int) -> Int {
        //                return input - 1
        //            }
        //            return backward ? stepBackward : stepForward
        //        }
        
        //        var currentValue = 3
        //        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        
        //        print("Counting to zero:")
        // Counting to zero:
        //        while currentValue != 0 {
        ////            print("\(currentValue)... ")
        //            currentValue = moveNearerToZero(currentValue)
        //        }
        //        print("zero!")
        
        
        
        // MARK: - Methods
        
        let company = Methods()
        // company.useCompanyCar(car: "BMW")
        // Methods.companyCar(car: "Audi", color: "White")
        // Methods.emp(name: "om", age: 12).person()
        
        //        var somePoint = Methods.Point(x: 1.0, y: 1.0)
        //        somePoint.moveBy(x: 2.0, y: 3.0)
        //        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        
        // MARK: - Closures
        
        let clos = Closure()
        //        clos.demo()
        // clos.sayHello("om")
        // let output = clos.add(3, 5)
        // print(output)
        
        //        reversed = clos.names.sorted(by: { (s1: String, s2: String) -> Bool in
        //            return s1 > s2
        //        })
        //        reversed = clos.names.sorted(by: { s1, s2 in return s1 > s2 } )
        
        //        var reversed = clos.names.sorted(by: { s1, s2 in s1 > s2 } )
        
        //        reversed = clos.names.sorted(by: { $0 > $1 } )
        
        //        var reversed = clos.names.sorted(by: >)
        //        print(reversed)
        
        //        let add = { (a: Int, b: Int) -> Int in
        //            return a + b
        //        }
        
        func add(_ a: Int, _ b: Int) -> Int {
            return a + b
        }
        
        var add1 = add
        
        var resu = add(10,20)
        print(resu)
        
        // MARK: - Enums
        
        //        var enumval = Enums.Directions.north(move: "move up norh")
        //        var enum2 = enumval
        //        print(enumval)
        //        enum2 = .south
        //        print( enum2)
        //        print(enumval)
        
        var trafficmove = Enums.TrafficLight.red
        //        print(trafficmove.canGo)
        
        var mutaue = Enums.SwitchState.on
        //        print(  mutaue)
        //        mutaue.toggle()
        //        print(  mutaue)
        
        
        //        let numberOfChoices =
        //        Enums.Beverage.allCases.count
        
        //        let positionToFind = 12
        //        if let somePlanet = Enums.planet(rawValue: positionToFind) {
        //            switch somePlanet {
        //            case .earth:
        //                print("Mostly harmless")
        //            default:
        //                print("Not a safe place for humans")
        //            }
        //        } else {
        //            print("There isn't a planet at position \(positionToFind)")
        //        }
        
        //        let response1 = Enums.Result.success(data: "User loaded",token: "sd35sd5gv4s")
        //        let response2 = Enums.Result.failure(error:  "Network error",msg: "No internet")
        
        //        switch response2 {
        //        case .success(let data):
        //            print("Success:", data)
        //
        //        case .failure(let error):
        //            print("Error:", error)
        //        }
        
        //        let a = Enums.MyOptional.some("string value")
        //        print("value of optional enum \(a)")
        //
        //        let b = Enums.MyOptional<String>.none
        //        print("value of optional enum \(b)")
        
        
        //        if case .qrCode(let productCode) = Enums.Barcode.qrCode("4576876") {
        //            print("QR code: \(productCode).")
        //        }
        
        //
        //        let state = Enums.ScreenState.success(data: "nil")
        //
        //        switch state {
        //        case .success(let data):
        //            if let text = data {
        //                print("value of data \(text)")
        //            } else {
        //                print("Success but empty data")
        //            }
        //        default:
        //            break
        //        }
        
        
        let response = Enums.APIResponse.success(nil)
        
        //        switch response {
        
        
        //            case .success(let .some(statusCode)):
        //            print("Success: \(statusCode)")
        //
        //        case .success(.none):
        //            print("none: ")
        //
        //        case .failure:
        //            print("Error: Failed")
        //        }
        
        //        var va : Any = "swift"
        //        va = 10
        //        var type = value as! String
        
        
        //MARK: - recursive enum
        
        //        Enums.barCodeExample()
        
        //        let five = Enums.Expression.number(5)
        //        let three = Enums.Expression.number(3)
        //
        //        let sum = Enums.Expression.addition(five, three)
        //
        //        let evalsum = Enums.evaluate(sum)
        //        print(evalsum)
        
        
        //MARK: - Inheritance
        
        
        //        let care = Inheritence.Vehicle( 20,wheels: 4)/
        //        print(care.description)
        //        print(care.speed)
        //        care.makenoise()
        
        //        let xpulse = Inheritence.Bike(speed: 42, wheels: 2, isHelmetworn: false, isPetrolThere: true)
        //        print(xpulse.description)
        //        print("bike speed",xpulse.speed)
        
        //        xpulse.isHelmetworn = true
        //        xpulse.payfine(ishelmet: true )
        //        xpulse.makenoise()
        
        //        let cycle  = Inheritence.Bicycle(20, wheels: 2)
        //        cycle.makenoise()
        //        print(cycle.description)
        //
        //        print("chaeck",cycle is Inheritence.Vehicle)
        
        
        
        let account = Inheritence.SavingsAccount()
        //        account.balance = 1000
        //        account.interestRate = 0.07
        //
        //        print(account.summary)
        
        //        let accaudit = Inheritence.AuditedSavingsAccount()
        //        accaudit.balance=1000
        //        accaudit.balance=1050
        
        //        let devic = Inheritence.Device()
        //        print(devic.status)
        
        let changedevice = Inheritence.SmartDevice()
        let changedevice2 = Inheritence.NewSmartDevice()
        
        //        changedevice.status = "back online"
        //        print(changedevice.status)
        //        print(changedevice2.internalStatus)
        
        
        
        //MARK: - Error Handeling
        
        //MARK: - example 1
        
        //        do {
        //            try ErrorHand.makeASandwich()
        //            ErrorHand.eatASandwich()
        //        } catch ErrorHand.SandwichError.outOfCleanDishes {
        //            ErrorHand.washDishes()
        //        } catch ErrorHand.SandwichError.missingIngredients(let ingredients) {
        //            ErrorHand.buyGroceries(ingredients)
        //        } catch {
        //            print("Some other error:", error)
        //        }
        
        //MARK: - Example 2
        //        do {
        //            try ErrorHand.rideBike(fuellevel: 1)
        //            ErrorHand.ridecomplete()
        //        } catch ErrorHand.BikeEror.flatTire , ErrorHand.BikeEror.brokenChain {
        //            print("low fuel and flat tire")
        //            //        } catch ErrorHand.BikeEror.noFuel {
        //            //            ErrorHand.fillFuel()
        //            //        } catch ErrorHand.BikeEror.brokenChain {
        //            //            ErrorHand.replaceChain()
        //            //        }
        //        }catch {
        //            print("Unknown error: \(error)")
        //        }
        
        
        
        //MARK: - Type Casting
        
        //MARK:         Exampal
        
        //        var type1 : String  = "1"
        //        var type2 = type1 as! String
        //
        //        print("type 2",type2 is String)
        //        print("type 2",type2 is Character)
        
        //        TypeCasting.typecheeck()
        
        //        var movieObj = TypeCasting.Movie(name: "Animal", director: "Vanga") // ok
        //
        //        var songobj = TypeCasting.Song(name: "Dard-e-Disco", artist: "Vishal-Sekher") //ok
        //
        //        var songobj2 = TypeCasting.Song(name: "Zingat", artist: "Ajay Atul") as TypeCasting.MediaItem //upcasting // song
        //
        //        var song2 = songobj2 as! TypeCasting.Song
        //        var song3 = song2 as! TypeCasting.MediaItem //Song
        //
        //        var mediaobj = TypeCasting.MediaItem(name: "media Item Name")
        
        //        movieObj.direct()
        //        songobj.song()
        //        print(type(of: movieObj)) //movie
        //        print(type(of: songobj)) //song
        //        print(type(of: songobj2)) //song
        //        print(type(of: song2))//song
        //        print(type(of: song3))//song
        //        print(type(of: mediaobj)) //MediaItem
        
        //        songobj2.song()
        //        print(songobj2.name)
        
        //MARK: - Extension
        
        //        Extensionclass.checktype()
        //        let cir = Circle(radius: 5)
        //        let cir2 = Circle(radi: 2)
        
        //        cir.radius = 2.0
        
        //        print(cir.area)
        //        print(cir2.area)
        
        //        var quote = "   honesty is the best policy . . |"
        //        print("lenght of quote before trim",quote.count)
        //     quote.trim()
        //        print(quote.count)
        //        print("lenght of quote after trim",qoutetrim.count)
        
        
        //MARK: - Protocols
        
        //        var protoclass = Starship(name: "Om", prefix: "Sir")
        //        print(protoclass.name)
        //        print(protoclass.fullName)
        //        print(protoclass.prefix ?? "Sir")
        
        
        let objkitchen = Kitchen()
        
        //        objkitchen.dishwasher = Dishwasher(_voltage: 220, _waterLevel: 5)
        //        objkitchen.dishwasher?.stop()
        
        
        //MARK: - Access Control
        
        var acc = AccessControl(username: "om", password: "1234")
        
        //        print(acc.username)
        //        print(acc.validatePassword("1234"))
        
        
        
        //        func printinvoice(){
        //            var bal = Transaction(balance: 100)
        //            var baln = bal.balance
        //            print(" balance is \(baln)")
        //        }
        
        //        printinvoice()
        
        
        //        var clsob = Profile(bio: "hello profile")
        
        do{
            
            //            let bill = try electricityBill(120)
            //            print(bill)
        }catch let e{
            //            print("error occured ",e)
        }
        
        //
        //        let discountamount = applydiscount(billAmount: bill, coupon: "@#$123456")
        //        print("your dicounted bill is \(discountamount)")
        
        
        //        var mp = Musicplayer()
        //        var np = NowPlayingScreen()
        //        var np2 = NowPlayingScreen()
        //        mp.musicDelegate = np2
        //        mp.play(song: "chaiya chaiya")
        
        //MARK: - AcessControl
        
        //        class big : UserManager{
        //            static func prinname(){
        ////                print(appName)
        ////                logout(username: "omi")
        //            }
        //        }
        
        //        let manager = UserManager()
        //
        //               manager.login(username: "Om")       // ✅ open
        //               manager.login(username: "ravi")       // ✅ open
        //               print(manager.appName)              // ✅ public
        //
        //                manager.usersCount              /* ❌ internal*/
        //        print(manager.usersCount)
        //        manager.logout(username: "Om")
        //        manager.logout(username: "ravi")
        //        print(manager.usersCount)
        ////        big.prinname()
        //        /*❌ internal*/
        //                /*manager.validate("Om")*/           /*❌ private*/
        //                /*manager.clearCache()*/             /*❌ fileprivate*/
        //
        //
        //
        //        let service = MathService()
        //
        //        print(service.add(2, 3))        // ✅ public
        //
        //        print(service.multiply(2, 3))
        //
        //
        //                let nai = AnimalFramework()
        //
        //               let sound = nai.animalSound()
        //                print(sound)
        
        // let test = Usercls()
        //        test.cretest()
        //
        //        let test2 = Usercls()
        //        test2.printname()
        
    
//        Closure.makeCounter()
    }
}
