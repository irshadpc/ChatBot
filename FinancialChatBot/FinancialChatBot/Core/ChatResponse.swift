//
//  FCBResponse.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


struct ChatResponse {
    var text : String
    var occurrence : Int
    
    
    mutating func updateOccurrence() {
        self.occurrence = self.occurrence + 1
    }
}