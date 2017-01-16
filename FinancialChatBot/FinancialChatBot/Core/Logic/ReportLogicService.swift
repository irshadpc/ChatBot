

import Foundation
import Parsimmon

struct ReportLogicService : LogicService {
    
    var classifier : CategoryClassifier {
        return CategoryClassifier.sharedInstance
    }
    
    var showReport : () -> () = {}
    
    let category = FinancialAction.Report.rawValue
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        
        let inputText = input.fullText()
        if classifier.classify(inputText) == category &&
            inputText.rangeOfString("report") != nil {
            
            self.showReport()
            var response = ChatStatement(text: "Who will form report")
            response.finishStatement = true
            return (response,1)
        }

        return (input,0)
    }

}
