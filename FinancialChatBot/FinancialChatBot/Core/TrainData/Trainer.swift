

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
        data.forEach { item in
            classifier.trainWithText(item, category: category)
        }
    }
}

struct DefaultTrainer : Trainer {
    
}
