//
//  FourthViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        finish()
    }
    
    @IBAction func onClickReturnSecond(_ sender: UIButton) {
        finish(option: .popToViewController, specifiedViewController: .SecondViewController)
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.FifthViewController)
    }
}
