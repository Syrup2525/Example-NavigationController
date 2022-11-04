//
//  NavigationViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isNavigationBarHidden = true
        
        self.viewControllers = [ViewController.RootViewController.get()]
    }
}
