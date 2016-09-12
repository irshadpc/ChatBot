//
//  FBOutputService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation

protocol OutputService {
    func processResponse(input:ChatStatement) -> String
}
