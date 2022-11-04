//
//  FirstViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class FirstViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.SecondViewController)
    }
}
