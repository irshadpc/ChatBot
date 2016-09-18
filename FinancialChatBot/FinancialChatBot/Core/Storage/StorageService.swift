
import Foundation


protocol StorageService {
    func find(statement:ChatStatement)
    func update(statement:ChatStatement)
    func responseStatements() -> [ChatStatement]
    func remove(statementText:String)
}

struct PlainStorageService:StorageService {
    func find(statement:ChatStatement) {}
    func update(statement:ChatStatement) {}
    func responseStatements() -> [ChatStatement] {
        return []
    }
    func remove(statementText:String) {}
}
