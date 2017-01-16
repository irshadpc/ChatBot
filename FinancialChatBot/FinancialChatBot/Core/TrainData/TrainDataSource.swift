
import Foundation

protocol TrainDataSource {
    func trainData() -> [String]
}

struct SpentDataSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "I spent","on","food","Spent", "spent", "spent", "shot", "squandered", "squandered",
            "Squandered", "spending", "bribed", "buy", "bought", "acquired", "acquired", "procured", "c", "shop"
        ]
    }
}

struct RemainingDataSource : TrainDataSource {
    func trainData() -> [String] {
        return [
            "Bestowed", "acquired", "earned", "earned",
            "Acquired", "acquired", "acquired", "received", "money", "back", "debt", "debt", "salary", "come", "pay", "pay",
            "Wages", "salary", "money",
        ]
    }
}

struct ReportDataSource : TrainDataSource {
    
    func trainData() -> [String] {
        return [
            
            "How much", "spent", "report",
            "spending", "spent", "for", "show",
            "cformiruy", "give", "Report back"
        ]
    }
}

struct StopWordsSource : TrainDataSource {
    func trainData() -> [String] {
        return [
          "Hello", "hello", "how", "business",
        ]
    }

}
