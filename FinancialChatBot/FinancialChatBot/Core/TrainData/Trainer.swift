

import Foundation
import Parsimmon

protocol Trainer {
    mutating func trainClassifier(dataSource:TrainDataSource,
                                  classifier:NaiveBayesClassifier,
                                  category:String)
}

extension Trainer {
    mutating func trainClassifier(dataSource:TrainDataSource,
                                  classifier:NaiveBayesClassifier,
                                  category:String) {
        let data = dataSource.trainData()
        classifier.trainWithTokens(data, category: category)
    }
}

struct DefaultTrainer : Trainer {
    
}
