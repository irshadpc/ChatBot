//
//  FBLogicService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


protocol LogicService  {
    func canProcessInput(input:ChatStatement) -> Bool
    func processInput(input:ChatStatement) -> (ChatStatement, Float)
}


extension LogicService {
    
    // Default implementation without no logic
    func canProcessInput(input:ChatStatement) -> Bool {
        return true
    }
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        return (input, 1)
    }
}
