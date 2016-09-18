

import Foundation


/*
 Storage adapters - Provide an interface for bot to connect to various storage systems such as CoreData
 or local file storage. They should store all message history
 Input adapters - Provide methods that allow bot to get input from a defined input type.
 Output adapters - Provide methods that allow bot to return a response (formatter, send to server, etc)
 Logic adapters - Define the logic that bot uses to respond to input it receives.
 */


protocol ChatContext {
    var storage: StorageService { get }
    var input: InputService { get }
    var ouput: OutputService { get }
    var logic : LogicService {get}
}

class ChatEngine : ChatContext {
    
    var sendResponse: (String -> Void) = {_ in}
    
    var storage: StorageService
    var input: InputService
    var ouput: OutputService
    var logic : LogicService
    var recentStatements : [ChatStatement]
    
    
    init(storage:StorageService, input:InputService, output:OutputService, logic : LogicService) {
        self.storage = storage
        self.input = input
        self.ouput = output
        self.logic = logic
        self.recentStatements = []
    }
    
    func processResponse(input:InputType) {
        let statement = self.input.processInput(input)
        let statementWithResponses = self.updateStatementWithHistory(statement)
        
        let (logicStatement,_) = self.logic.processInput(statementWithResponses)
        if logicStatement.finishStatement { self.removeHistory() }
        
        let response = self.ouput.processResponse(logicStatement)
        
        updateHistory(statement)
        sendResponse(response)
    }
    
    func updateHistory(newStatement : ChatStatement) {
        self.recentStatements.append(newStatement)
        // Fix size for word context
        if self.recentStatements.count > 2  {
            self.removeHistory()
        }
    }
    
    func removeHistory() {
        self.recentStatements = []
    }
        
    
    func updateStatementWithHistory(newStatement:ChatStatement) -> ChatStatement {
        var statementWithHistory = ChatStatement(text: newStatement.text)
        self.recentStatements.forEach { oldStatement in
            statementWithHistory.add(oldStatement)
        }
        return statementWithHistory
    }
}

