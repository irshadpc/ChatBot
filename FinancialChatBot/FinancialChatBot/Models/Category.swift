

import Foundation


struct Category {
    var type : String
    var amount : Float
    
    mutating func updateAmount(newAmount:Float) {
        self.amount = newAmount + self.amount
    }
}
