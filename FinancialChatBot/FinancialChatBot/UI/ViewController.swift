

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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        messageController.sendMessage("Покажи мне отчет", sender: userSenderName)
    }
    
    func setupMessageUI() {
        messageController.senderId = chatBotSenderName
        messageController.senderDisplayName = chatBotSenderName
        messageController.willMoveToParentViewController(self)
        self.addChildViewController(messageController)
        view.addSubview(messageController.view)
        messageController.didMoveToParentViewController(self)
        messageController.view.alignToView(self.view)
        
        messageController.userSendNewMessage = { [unowned self] (message:Message) in
            self.sendNewMessageToEngine(message.text)
        }
    }
    
    func showReport(data:FinancialReport) {
        let reportController = ReportViewController(reportData: data)
        self.presentViewController(reportController, animated: true, completion:nil)
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

        let spentRemainingLogic = SpentRemainingLogicService()
        let reportLogic = ReportLogicService()
        let logic = MultiLogicService(services: [spentRemainingLogic,reportLogic])
        return logic
    }
    
    func sendNewMessageToEngine(text:String) {
        guard let engine = self.chat else { return }
        let input = InputType.Text(text)
        engine.processResponse(input)
    }
    
    func sendNewMessageToUser(text:String) {
        messageController.engineSendMessage(text, sender: chatBotSenderName)
    }

}

