

import Foundation
import Parsimmon

public enum FinancialAction : String {
    case Spent
    case Remaining
    case Report
}


struct SpentRemainingLogicService : LogicService {
    
    var classifier : CategoryClassifier {
        return CategoryClassifier.sharedInstance
    }
    
    private let targetCategories = [FinancialAction.Spent.rawValue, FinancialAction.Remaining.rawValue]
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        
        let category = classifier.classify(input.fullText())
        if targetCategories.contains(category)  {
            let response = ChatStatement(text: "Принято")
            return (response,1)
        }
        
        return (input,0)
    }

}
