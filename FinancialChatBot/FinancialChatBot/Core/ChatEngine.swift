

import Foundation

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
        let response = self.ouput.processResponse(logicStatement)
        
        updateHistory(statement)
        sendResponse(response)
    }
    
    func updateHistory(newStatement : ChatStatement) {
        self.recentStatements.append(newStatement)
    }
    
    func updateStatementWithHistory(newStatement:ChatStatement) -> ChatStatement {
        var statementWithHistory = ChatStatement(text: newStatement.text)
        self.recentStatements.forEach { oldStatement in
            statementWithHistory.add(oldStatement)
        }
        return statementWithHistory
    }
    
    
}

