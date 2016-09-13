


import Foundation
import JSQMessagesViewController

class  Message : NSObject {
    var messageText: String
    var messageSender: String
    var messageDate: NSDate
    
    convenience init(text: String?, sender: String?) {
        self.init(text: text, sender: sender, imageUrl: nil)
    }
    
    init(text: String?, sender: String?, imageUrl: String?) {
        self.messageText = text!
        self.messageSender = sender!
        self.messageDate = NSDate()
    }
}

extension Message : JSQMessageData {
    
    func text() -> String! {
        return messageText
    }
    
    func sender() -> String! {
        return messageSender;
    }
    
    func date() -> NSDate! {
        return messageDate;
    }
    
    func imageUrl() -> String? {
        return "";
    }
    
    func senderId() -> String! {
        return "1"
    }
    
    func senderDisplayName() -> String! {
        return self.messageSender
    }
    
    func isMediaMessage() -> Bool {
        return false
    }
    
    func messageHash() -> UInt {
        return 123
    }

}