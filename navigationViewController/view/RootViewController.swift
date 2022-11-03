//
//  ViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class RootViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.FirstViewController)
    }
}

extension RootViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let count = self.navigationController?.viewControllers.count, count > 1 {
            return true
        } else {
            return false
        }
    }
}
