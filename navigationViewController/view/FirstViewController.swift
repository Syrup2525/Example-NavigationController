//
//  FirstViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class FirstViewController: BaseViewController {
    @IBOutlet var lbResult: UILabel!
    
    enum RequestCode: Int {
        case secondViewController = 10000
        case presentViewConttroller = 10001
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setOnViewControllerResult() { requestCode, resultCode, data in
            var message = ""
            
            if let requestCode = RequestCode(rawValue: requestCode ?? 0) {
                switch requestCode {
                case .secondViewController: message = "secondViewController\n"
                case .presentViewConttroller: message = "presentViewConttroller\n"
                }
            }
            
            if let resultCode = resultCode {
                switch resultCode {
                case .RESULT_OK: message = "\(message).RESULT_OK"
                case .RESULT_CANCEL: message = "\(message).RESULT_CANCEL"
                case .RESULT_FAIL: message =  "\(message).RESULT_FAIL"
                }
            }
            
            self.lbResult.text = message
        }
    }
    
    @IBAction func onClickPresent(_ sender: UIButton) {
        self.requestCode = RequestCode.presentViewConttroller.rawValue
        startViewController(.PresentViewController, option: .present)
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        self.requestCode = RequestCode.secondViewController.rawValue
        startViewController(.SecondViewController)
    }
}
