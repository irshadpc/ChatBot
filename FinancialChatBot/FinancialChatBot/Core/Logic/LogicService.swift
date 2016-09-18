

import Foundation


protocol LogicService  {
    func canProcessInput(input:ChatStatement) -> Bool
    func processInput(input:ChatStatement) -> (ChatStatement, Float)
}


extension LogicService {

    
    // Default implementation without no logic
    func canProcessInput(input:ChatStatement) -> Bool {
        return true
    }
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        return (input, 1)
    }
}
