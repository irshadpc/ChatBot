//
//  HashStorageService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


struct HashStorageService  {

}

extension HashStorageService : StorageService {
    
    func find(statement:ChatStatement) {
        
    }
    
    func update(statement:ChatStatement) {
        
    }
    
    func responseStatements() -> [ChatStatement] {
        let empty = ChatStatement(text: "Empty")
        return [empty]
    }
    
    func remove(statementText:String) {
        
    }
}