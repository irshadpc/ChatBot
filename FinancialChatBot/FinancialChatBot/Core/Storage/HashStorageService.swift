
import Foundation


struct HashStorageService  {

}

extension HashStorageService : StorageService {
    
    func find(statement:ChatStatement) {
        
    }
    
    func update(statement:ChatStatement) {
        
    }
    
    func responseStatements() -> [ChatStatement] {
        let empty = ChatStatement(text: "Empty")
        return [empty]
    }
    
    func remove(statementText:String) {
        
    }
}
