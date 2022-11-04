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
        
        NotificationCenter.default.addObserver(self, selector: #selector(clearTop(_:)), name: .viewControllerClearTop, object: nil)
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.FirstViewController)
    }
    
    @objc func clearTop(_ notification: Notification) {
        guard
            let object = notification.object as? [String:Any],
            let viewController = object["viewController"] as? ViewController,
            let animated = object["animated"] as? Bool
        else {
            return
        }
        
        self.navigationController?.popToRootViewController(animated: false)
        self.navigationController?.pushViewController(viewController.get(), animated: animated)
    }
}

extension RootViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let count = self.navigationController?.viewControllers.count, count > 2 {
            return true
        } else {
            return false
        }
    }
}
