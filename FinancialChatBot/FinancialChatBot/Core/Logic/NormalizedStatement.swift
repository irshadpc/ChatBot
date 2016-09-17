//
//  NormalizedStatement.swift
//  FinancialChatBot
//
//  Created by Andrew on 9/17/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation
import Parsimmon


struct StatementNormalizer {
    
    func processTags(input:ChatStatement) -> [TaggedToken] {
        let tagger = Tagger()
        let taggedTokens = tagger.tagWordsInText(input.text)
        return taggedTokens
    }
    
    func tokenize(input:ChatStatement) -> [String] {
        let token = Tokenizer()
        let tokens = token.tokenize(input.text)
        return tokens
    }
}
