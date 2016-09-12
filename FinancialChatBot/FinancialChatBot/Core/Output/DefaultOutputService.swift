//
//  DefaultOutputService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


struct DefaultOutputService : OutputService {
    
    func processResponse(input:ChatStatement) -> String {
        return input.text
    }
}