
import Foundation


class DataStorage {
    
    var data : [String : Float]
    
    static let sharedInstance = DataStorage()
    private init() {
        data = [:]
    }
}

extension DataStorage {
    
    func add(money:Float, to category:String) {
        var amountWithThisCategory = data[category] ?? 0
        amountWithThisCategory += money
        data[category] = amountWithThisCategory
    }
    
    func financialReport() -> FinancialReport {
        let categories = data.map { type, amount in
            Category(type: type, amount: amount)
        }
        return FinancialReport(categories: categories,title: "Financial report")
    }
}
