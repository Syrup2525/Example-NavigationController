//
//  SecondViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class SecondViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.ThirdViewController, option: .push)
    }
    
    @IBAction func finishResultOk(_ sender: UIButton) {
        resultCode = .RESULT_OK
        finish()
    }
    
    @IBAction func finishResultFail(_ sender: UIButton) {
        resultCode = .RESULT_FAIL
        finish()
    }
    
    override func onBackPress() {
        resultCode = .RESULT_CANCEL
        finish()
    }
}
