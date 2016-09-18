//
//  FinancialCategory.swift
//  FinancialChatBot
//
//  Created by Andrew on 9/17/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


struct Category {
    var type : String
    var amount : Float
    
    mutating func updateAmount(newAmount:Float) {
        self.amount = newAmount + self.amount
    }
}
