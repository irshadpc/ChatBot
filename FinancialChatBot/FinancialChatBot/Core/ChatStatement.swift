

import Foundation

struct ChatStatement {
    
    private var inResponseToQueue : [ChatStatement]
    let text : String
    var finishStatement : Bool  = false
    
    init(text:String) {
        self.text = text
        inResponseToQueue = []
    }
    
    mutating func add(response:ChatStatement) {
        inResponseToQueue.append(response)
    }
    
    mutating func remove(response:ChatResponse) {
        let newQueue = inResponseToQueue.filter { $0.text == response.text}
        inResponseToQueue = newQueue
    }
}

extension ChatStatement {
    
    func fullText() -> String {
        let result = self.inResponseToQueue.reduce(" ", combine: { (text, statement) -> String in
            return text + " " + statement.text
        })
        return (result + " " + self.text).lowercaseString
    }
}
