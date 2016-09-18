


import UIKit
import Foundation
import JSQMessagesViewController

let userSenderName = "User"
let chatBotSenderName = "Bot"

class MessagesViewController :  JSQMessagesViewController {
    
    var userSendNewMessage: (Message -> Void)?
    
    lazy var messages :[Message] = {
       return []
    }()
    
    var avatars : [String : JSQMessagesAvatarImage] = [:]

    
    var outgoingBubbleImageView : JSQMessagesBubbleImage = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    var incomingBubbleImageView : JSQMessagesBubbleImage = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleGreenColor())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderDisplayName = senderDisplayName ?? chatBotSenderName
        setupAvatarColor(senderDisplayName, incoming: false)
        setupAvatarColor(userSenderName, incoming: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout.springinessEnabled = false
    }

    func sendMessage(text: String!, sender: String!) {
        let message = Message(text: text, sender: sender)
        messages.append(message)
        reportUserSendNewMessage(message)
    }
    
    func reportUserSendNewMessage(message: Message) {
        guard let userSendNewMessage = userSendNewMessage else { return }
        userSendNewMessage(message)
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        sendMessage(text, sender: userSenderName)
        finishSendingMessage()
    }
    
    func setupAvatarColor(name: String, incoming: Bool) {
        let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
        
        let rgbValue = name.hash
        let r = CGFloat(Float((rgbValue & 0xFF0000) >> 16)/255.0)
        let g = CGFloat(Float((rgbValue & 0xFF00) >> 8)/255.0)
        let b = CGFloat(Float(rgbValue & 0xFF)/255.0)
        let color = UIColor(red: r, green: g, blue: b, alpha: 0.5)
        
        let nameLength = name.characters.count
        let initials : String? = name.substringToIndex(senderDisplayName.startIndex.advancedBy(min(3, nameLength)))
        let userImage = JSQMessagesAvatarImageFactory.avatarImageWithUserInitials(initials, backgroundColor: color, textColor: UIColor.blackColor(), font: UIFont.systemFontOfSize(CGFloat(13)), diameter: diameter)
        
        avatars[name] = userImage
    }

}

typealias MessageControllerPublicMethods = MessagesViewController
extension MessageControllerPublicMethods {
    
    func engineSendMessage(text:String, sender:String) {
        let message = Message(text: text, sender: sender)
        messages.append(message)
        self.collectionView.reloadData()
    }
}
