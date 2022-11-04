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
        startViewController(.ThirdViewController)
    }
    
    @IBAction func finishResultOk(_ sender: UIButton) {
        setResult(resultCode: .RESULT_OK)
        finish()
    }
    
    @IBAction func finishResultFail(_ sender: UIButton) {
        setResult(resultCode: .RESULT_FAIL)
        finish()
    }
    
    override func onBackPress() {
        setResult(resultCode: .RESULT_CANCEL)
        finish()
    }
}
