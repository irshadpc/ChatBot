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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let input = InputType.Text("Simple text")
        let response = self.chat!.getResponse(input)
        print(response)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

