//
//  ReportLogicService.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/16/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation
import Parsimmon

struct ReportLogicService : LogicService {
    
    let classifier : NaiveBayesClassifier = {
        return NaiveBayesClassifier()
    }()
    
    let category = FinancialAction.Report.rawValue
    
    
    init() {
        var trainer = DefaultTrainer()
        trainer.trainClassifier(ReportDataSource(), classifier: self.classifier, category: category)
    }
    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        
        let token = Tokenizer()
        let lemmatizedTokens = token.tokenize(input.text)
        print(lemmatizedTokens)
        
        lemmatizedTokens.forEach { item in
            print(classifier.classify(item))
        }
        
        if classifier.classify(input.text) == category  {
            let response = ChatStatement(text: "Сейчас сформирую")
            return (response,1)
        }
        
        return (input,0)
    }

}
