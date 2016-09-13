//
//  MessagesViewController.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import UIKit
import Foundation
import JSQMessagesViewController

class MessagesViewController :  JSQMessagesViewController {
    
    private lazy var messages :[Message] = {
       return []
    }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout.springinessEnabled = true
    }

    func sendMessage(text: String!, sender: String!) {
        let message = Message(text: text, sender: sender, imageUrl: nil)
        messages.append(message)
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        sendMessage(text, sender: senderDisplayName)
        finishSendingMessage()
    }
}
