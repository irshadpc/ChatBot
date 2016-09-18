
import Foundation


struct DefaultOutputService : OutputService {
    
    func processResponse(input:ChatStatement) -> String {
        return input.text
    }
}
