//
//  ViewController.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/12/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var chat : ChatEngine?
    private lazy var messageController : MessagesViewController = {
       return MessagesViewController()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChatEngine()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setupMessageUI()
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.sendNewMessageToEngine("Я тут истратил на еду 35 грн ")
    }
    
    func setupMessageUI() {
        messageController.senderId = "Andrew"
        messageController.senderDisplayName = "Andrew"
        messageController.willMoveToParentViewController(self)
        self.addChildViewController(messageController)
        view.addSubview(messageController.view)
        messageController.view.frame = view.frame
        messageController.didMoveToParentViewController(self)
        
        messageController.userSendNewMessage = { (message:Message) in
            self.sendNewMessageToEngine(message.messageText)
        }
    }
}

private extension ViewController {
    
    func setupChatEngine() {
        let input = DefaultInputService()
        let output = DefaultOutputService()
        let storage = HashStorageService()
    
        self.chat = ChatEngine(storage: storage, input: input, output: output, logic: self.logic())
        
        self.chat!.sendResponse = { response in
            self.sendNewMessageToUser(response)
        }
    }
    
    func logic() -> LogicService {
        let empty = EmptyLogicService()
        let spentRemainingLogic = SpentRemainingLogicService()
        let logic = MultiLogicService(services: [empty,spentRemainingLogic])
        return logic
    }
    
    func sendNewMessageToEngine(text:String) {
        guard let engine = self.chat else { return }
        let input = InputType.Text(text)
        engine.processResponse(input)
    }
    
    func sendNewMessageToUser(text:String) {
        messageController.engineSendMessage(text, sender: "Bot")
    }

}

