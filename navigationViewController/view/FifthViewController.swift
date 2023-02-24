//
//  FifthViewController.swift
//  navigationController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class FifthViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        finish(true, option: .popToRootViewController)
    }
}
