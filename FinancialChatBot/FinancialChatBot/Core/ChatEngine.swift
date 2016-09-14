//
//  FBChatBotEngine.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


protocol ChatService {
    var context : ChatContext? { get set }
}

protocol ChatContext {
    var storage: StorageService { get }
    var input: InputService { get }
    var ouput: OutputService { get }
    var logic : LogicService {get}
}

struct ChatEngine : ChatContext {
    
    var sendResponse: (String -> Void) = {_ in}
    
    var storage: StorageService
    var input: InputService
    var ouput: OutputService
    var logic : LogicService
    
    
    init(storage:StorageService, input:InputService, output:OutputService, logic : LogicService) {
        self.storage = storage
        self.input = input
        self.ouput = output
        self.logic = logic
    
//        self.storage.context = self
//        self.input.context = self
//        self.ouput.context = self
//        self.logic.context = self
    
    }
    
    func processResponse(input:InputType) {
        let statement = self.input.processInput(input)
        let (logicStatement,_) = self.logic.processInput(statement)
        let response = self.ouput.processResponse(logicStatement)
        sendResponse(response)
    }
}

