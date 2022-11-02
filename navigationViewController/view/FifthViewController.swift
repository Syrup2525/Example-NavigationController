//
//  FifthViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class FifthViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        finish()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
//        guard
//            let count = self.navigationController?.viewControllers.count
//        else {
//            return
//        }
        
//        self.navigationController?.viewControllers.removeSubrange(1...count - 1)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
