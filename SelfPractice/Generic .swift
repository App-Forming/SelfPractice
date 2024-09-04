//
//  Generic .swift
//  SelfPractice
//
//  Created by Lingam on 29/08/24.
//

import Foundation
import UIKit

//Normal func with Int
func displayMyData(data:Int) -> Int{
    return data
}
// Noraml function with string
func displayMyDataStr(data:String) -> String{
    return "\(data)"
}

// Generic func

func displayData<T>(data:T) -> T{
    return data
}


let a = displayMyData(data: 10)
let b = displayMyDataStr(data: "iOS Developer")
let c = displayData(data: "Ios developeer")


class GernericClass<T>{
    var mydata : T
    
    init(mydata: T) {
        self.mydata = mydata
    }
    
    func getMyData() -> T{
        return mydata
    }
}


let call1 = GernericClass(mydata: 25)
let call2 = GernericClass(mydata: "ios")


class Animal {

    private var legCount1: Int = 0
    public var legCount2: Int = 0
    internal var legCount3: Int = 0
    fileprivate var legCount4: Int = 0
    open var legCount5: Int = 0


      
    private func display1() {
      print("I am an animal1.");
    }
    public func display2() {
      print("I am an animal2.");
    }
    fileprivate func display3() {
      print("I am an animal3.");
    }
    internal func display4() {
      print("I am an animal4.");
    }
    open func display5() {
      print("I am an animal5.");
    }
}

class WildForest:Animal{
    
    override func display2() {
        print("")
    }
}
