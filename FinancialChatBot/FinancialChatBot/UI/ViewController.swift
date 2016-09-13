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
    
    func setupChatEngine() {
        let input = DefaultInputService()
        let logic = EmptyLogicService()
        let output = DefaultOutputService()
        let storage = HashStorageService()
        
        self.chat = ChatEngine(storage: storage, input: input, output: output, logic: logic)
    }
    
    func setupMessageList() {
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let input = InputType.Text("Simple text")
        let response = self.chat!.getResponse(input)
        print(response)
        
        self.setupMessageUI()
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func setupMessageUI() {
        messageController.senderId = "Andrew"
        messageController.senderDisplayName = "Andrew"
        messageController.willMoveToParentViewController(self)
        self.addChildViewController(messageController)
        view.addSubview(messageController.view)
        messageController.view.frame = view.frame
        messageController.didMoveToParentViewController(self)
    }
}

