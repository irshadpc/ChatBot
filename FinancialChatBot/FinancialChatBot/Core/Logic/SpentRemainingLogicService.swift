//
//  SpentRemainingLogicService.swift
//  FinancialChatBot
//
//  Created by Andrew on 9/13/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation
import Parsimmon

public enum FinancialAction : String {
    case Spent
    case Remaining
    case Report
}

enum FinancialCategory : String {
    case Spent
    case Remaining
}

struct SpentRemainingLogicService : LogicService {
    
    let classifier : NaiveBayesClassifier = {
        return NaiveBayesClassifier()
    }()
    
    private let targetCategories = [FinancialAction.Spent.rawValue, FinancialAction.Remaining.rawValue]
    
    init() {
        
        var trainer = DefaultTrainer()
        trainer.trainClassifier(SpentDataSource(), classifier: self.classifier, category: FinancialAction.Spent.rawValue)
        trainer.trainClassifier(RemainingDataSource(), classifier: self.classifier, category: FinancialAction.Remaining.rawValue)
    }
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        
        let normalizer = StatementNormalizer()
    
       // print(normalizer.processTags(input))
        print(normalizer.tokenize(input))
        
        return (input,0)
    }

}
