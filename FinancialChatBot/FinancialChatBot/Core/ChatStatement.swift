//
//  FBStatement.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation

struct ChatStatement {
    
    private var inResponseToQueue : [ChatStatement]
    let text : String
    
    init(text:String) {
        self.text = text
        inResponseToQueue = []
    }
    
    mutating func add(response:ChatStatement) {
        
        //var newQueue = inResponseToQueue.filter { $0.text == response.text}
        //if newQueue.count == inResponseToQueue.count {
        //    newQueue.append(response)
       // }
        
        //inResponseToQueue = newQueue
        inResponseToQueue.append(response)
    }
    
    mutating func remove(response:ChatResponse) {
        let newQueue = inResponseToQueue.filter { $0.text == response.text}
        inResponseToQueue = newQueue
        
    }
}
