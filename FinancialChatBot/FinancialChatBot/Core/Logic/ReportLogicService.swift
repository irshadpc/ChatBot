

import Foundation
import Parsimmon

struct ReportLogicService : LogicService {
    
    var classifier : CategoryClassifier {
        return CategoryClassifier.sharedInstance
    }
    
    let category = FinancialAction.Report.rawValue
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        
        if classifier.classify(input.fullText()) == category  {
            let response = ChatStatement(text: "Сейчас сформирую отчет")
            return (response,1)
        }

        return (input,0)
    }

}
