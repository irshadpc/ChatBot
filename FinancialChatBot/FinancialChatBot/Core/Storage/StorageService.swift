//
//  FBStorageService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation


protocol StorageService {
    func find(statement:ChatStatement)
    func update(statement:ChatStatement)
    func responseStatements() -> [ChatStatement]
    func remove(statementText:String)
}