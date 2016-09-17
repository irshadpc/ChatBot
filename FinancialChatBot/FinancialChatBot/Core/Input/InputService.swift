//
//  FBInputService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation

enum InputType {
    case Text(String)
    // In case we have different inputs (sound, etc)
}

protocol InputService {
    func processInput(input:InputType) -> ChatStatement
}

extension InputService {

    func processInput(input:InputType) -> ChatStatement {
        switch input {
        case .Text(let inputText):
            return ChatStatement(text: inputText)
        }
    }
}
