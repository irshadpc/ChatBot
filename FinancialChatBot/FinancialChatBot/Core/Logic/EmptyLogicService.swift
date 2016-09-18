

import Foundation


struct EmptyLogicService : LogicService {
    
    var classifier : CategoryClassifier {
        return CategoryClassifier.sharedInstance
    }
    
    let category = PublicActions.Intro.rawValue
    

    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        
        if category == classifier.classify(input.fullText())  {
            let response = ChatStatement(text: "Привет")
            return (response,1)
        }
        
        return (input,0)
    }
    
}
