//
//  ThirdViewController.swift
//  navigationController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class ThirdViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickClearTop(_ sender: UIButton) {
        startViewController(.FourthViewController, option: .clearTop)
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.FourthViewController, option: .push)
    }
}
