


import Foundation
import JSQMessagesViewController

class  Message : JSQMessage {
    /*var messageText: String
    var sender: String
    var messageDate: NSDate*/
    
    init(text: String?, sender: String?) {
        //super.init(senderId: sender, displayName: sender, text: text)
        super.init(senderId: sender, senderDisplayName: sender, date: NSDate(), text: text)
    }
    
   /* init(text: String?, sender: String?, imageUrl: String?) {
        self.messageText = text!
        self.messageSender = sender!
        self.messageDate = NSDate()
        super.ini
    }*/
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Message  {
    
//    func sender() -> String! {
//        return senderDisplayName;
//    }
    
  /*  func text() -> String! {
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
        return self.messageSender
    }
    
    func senderDisplayName() -> String! {
        return self.messageSender
    }
    
    func messageHash() -> UInt {
        return UInt(self.messageText.hash)
    }*/

}
