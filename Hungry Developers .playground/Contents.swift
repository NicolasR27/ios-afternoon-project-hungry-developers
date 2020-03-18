import UIKit

class Spoon {
    
    let lock = NSLock()
    var index = Int()
    
    func pickup(){
        lock.lock()
    }
    
    
    func putDown() {
        lock.lock()
    }
    
    
}

class Developer {
    var leftSpoon: Spoon?
    var rightSpoon: Spoon?
    
    
    
    func think() {
        guard let leftSpoon = leftSpoon, let rightSpoon = rightSpoon else {return}
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickup()
            rightSpoon.pickup()
        }else {
            rightSpoon.pickup()
            leftSpoon.pickup()
        }
    }
    
    
    func eat(){
        print("eat")
        usleep(UInt32.random(in:1000...10_1000_000))
        rightSpoon?.putDown()
        leftSpoon?.putDown()
        print("stop eating")
    }
    
    func run() {
        think()
        eat()
    }
}

