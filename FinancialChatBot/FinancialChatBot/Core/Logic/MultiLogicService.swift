

import Foundation


struct MultiLogicService {
    var services : [LogicService]
}

extension MultiLogicService : LogicService {
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        var maxReliability : Float = -1
        var resultStatement  = ChatStatement(text: "I don't understand you")
        
        self.services.forEach { service in
            let (outputStatement,reliability) = service.processInput(input)
            if reliability > maxReliability {
                resultStatement = outputStatement
                maxReliability = reliability
            }
        }
        
        return (resultStatement, maxReliability)
    }
}
