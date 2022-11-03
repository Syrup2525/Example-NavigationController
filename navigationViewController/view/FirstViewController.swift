//
//  ViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickClearTop(_ sender: UIButton) {
        startViewController(.SecondViewController, option: .clearTop)
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.SecondViewController)
    }
}


