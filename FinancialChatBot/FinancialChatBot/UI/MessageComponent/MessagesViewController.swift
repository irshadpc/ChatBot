


import UIKit
import Foundation
import JSQMessagesViewController

class MessagesViewController :  JSQMessagesViewController {
    
    var userSendNewMessage: (Message -> Void)?
    
    lazy var messages :[Message] = {
       return []
    }()

    
    var outgoingBubbleImageView : JSQMessagesBubbleImage = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    var incomingBubbleImageView : JSQMessagesBubbleImage = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleGreenColor())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderDisplayName = (senderDisplayName != nil) ? senderDisplayName : "Anonymous"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout.springinessEnabled = true
    }

    func sendMessage(text: String!, sender: String!) {
        let message = Message(text: text, sender: sender, imageUrl: nil)
        messages.append(message)
        reportUserSendNewMessage(message)
    }
    
    func reportUserSendNewMessage(message: Message) {
        guard let userSendNewMessage = userSendNewMessage else { return }
        userSendNewMessage(message)
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        sendMessage(text, sender: senderDisplayName)
        finishSendingMessage()
    }
}

typealias MessageControllerPublicMethods = MessagesViewController
extension MessageControllerPublicMethods {
    
    func engineSendMessage(text:String, sender:String) {
        let message = Message(text: text, sender: sender, imageUrl: nil)
        messages.append(message)
        self.collectionView.reloadData()
    }
}
