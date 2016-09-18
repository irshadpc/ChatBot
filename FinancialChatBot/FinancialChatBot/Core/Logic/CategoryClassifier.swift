
import Foundation
import Parsimmon

public enum FinancialAction : String {
    case Spent
    case Remaining
    case Report
}

public enum PublicActions: String {
    case Intro
}

class CategoryClassifier {
    private var classifier : NaiveBayesClassifier
    static let sharedInstance = CategoryClassifier()
    
    private init() {
        var trainer = DefaultTrainer()
        self.classifier = NaiveBayesClassifier()
        
        trainer.trainClassifier(SpentDataSource(), classifier: self.classifier, category: FinancialAction.Spent.rawValue)
        trainer.trainClassifier(RemainingDataSource(), classifier: self.classifier, category: FinancialAction.Remaining.rawValue)
        trainer.trainClassifier(ReportDataSource(), classifier: self.classifier, category: FinancialAction.Report.rawValue)
        trainer.trainClassifier(StopWordsSource(), classifier: self.classifier, category: PublicActions.Intro.rawValue)
    }
    
    func classify(text:String) -> String {
        if let category = classifier.classify(text) {
            return category
        }
        return ""
    }
}
