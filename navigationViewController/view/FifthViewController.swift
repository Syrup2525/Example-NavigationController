//
//  FifthViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        finish()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
