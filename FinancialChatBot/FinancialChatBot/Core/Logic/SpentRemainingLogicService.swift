

import Foundation
import Parsimmon


struct SpentRemainingLogicService : LogicService {
    
    var classifier : CategoryClassifier {
        return CategoryClassifier.sharedInstance
    }
    
    private let targetCategories = [FinancialAction.Spent.rawValue, FinancialAction.Remaining.rawValue]

    
    func processInput(input:ChatStatement) -> (ChatStatement, Float) {
        return self.checkProperTags(input)
    }
    
    func save(amount:Float, category:String) {
         DataStorage.sharedInstance.add(amount, to: category)
    }
    
    func parseNumber(input:String) -> Float {
        let digitSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        let numbers = input.stringByTrimmingCharactersInSet(digitSet)
        if let pureNumber = Float(numbers) {
            return pureNumber
        }
        return 0
    }
    
    func parsePaymentCategory(input:String) -> String {
        let cleanText = trimSpecialCharacted(input)
        let parts = cleanText.componentsSeparatedByString(" ")
        if parts.count > 0 {
            return parts.last!
        }
        return ""
    }
    
    func trimSpecialCharacted(input:String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890()'".characters)
        return String(input.characters.filter {!okayChars.contains($0) })
    }
        
    
    func checkProperTags(input:ChatStatement) -> (ChatStatement, Float) {
        
        let classifiedCategory = classifier.classify(input.fullText())
        let classified = targetCategories.contains(classifiedCategory)
        
        let normalizer = StatementNormalizer()
        let tags = normalizer.processTags(input)
        let numberTag = tags.filter {$0.description.containsString("Number")}
        let nounTags = tags.filter {$0.description.containsString("Noun") ||
                                    $0.description.containsString("PersonalName")}
        
        // Bayes classifier is not valid for case, when we have only number
        if nounTags.count == 0 && numberTag.count > 0 {
            let response = ChatStatement(text: "I received or spent?")
            return (response,1)
        }
        
        // If not classified, probably it not that meaning
        if  !classified {
            return (input, 0)
        }
        
        if numberTag.count == 0 && nounTags.count > 0 {
            let response = ChatStatement(text: "How many?")
            return (response,1)
        }
        
        if nounTags.count == 1 {
            let response = ChatStatement(text: "For what?")
            return (response,1)
        }

       
        if numberTag.count > 0 && nounTags.count > 0 {
            let number = parseNumber(numberTag.first!.description)
            let category = parsePaymentCategory(nounTags.last!.description)
            save(number, category: category)
        }
        
        var response = ChatStatement(text: "Accepted")
        response.finishStatement = true
        return (response,1)
        
    }
}
