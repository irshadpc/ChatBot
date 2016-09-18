
import Foundation
import Parsimmon

class CategoryClassifier {
    private var classifier : NaiveBayesClassifier
    static let sharedInstance = CategoryClassifier()
    
    private init() {
        var trainer = DefaultTrainer()
        self.classifier = NaiveBayesClassifier()
        
        trainer.trainClassifier(SpentDataSource(), classifier: self.classifier, category: FinancialAction.Spent.rawValue)
        trainer.trainClassifier(RemainingDataSource(), classifier: self.classifier, category: FinancialAction.Remaining.rawValue)
        trainer.trainClassifier(ReportDataSource(), classifier: self.classifier, category: FinancialAction.Report.rawValue)
    }
    
    func classify(text:String) -> String {
        if let category = classifier.classify(text) {
            return category
        }
        return ""
    }
}
