

import Foundation
import Parsimmon


struct StatementNormalizer {
    
    func processTags(input:ChatStatement) -> [TaggedToken] {
        let tagger = Tagger()

        let fullText = input.fullText()
        let taggedTokens = tagger.tagWordsInText(fullText)
        return taggedTokens
    }
    
    func tokenize(input:ChatStatement) -> [String] {
        let token = Tokenizer()
        let text = input.fullText()
        let tokens = token.tokenize(text)
        return tokens
    }
}
