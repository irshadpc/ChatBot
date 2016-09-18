


import Foundation
import JSQMessagesViewController

class  Message : JSQMessage {
  
    init(text: String?, sender: String?) {
        super.init(senderId: sender, senderDisplayName: sender, date: NSDate(), text: text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

