//
//  FourthViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class FourthViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickSixthButton(_ sender: UIButton) {
        startViewController(.SixthViewController)
    }
    
    @IBAction func onClickFifthButton(_ sender: UIButton) {
        startViewController(.FifthViewController)
    }
}
