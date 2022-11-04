//
//  UIViewControllerExtension.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/04.
//

import Foundation
import UIKit

extension UIViewController {
    final func startViewController(_ viewController: ViewController, animated: Bool = true, option: StartViewControllerOption? = nil) {
        switch option {
        case .clearTop:
            var object = [String:Any]()
            object.updateValue(viewController, forKey: "viewController")
            object.updateValue(animated, forKey: "animated")
            
            NotificationCenter.default.post(name: .viewControllerClearTop, object: object, userInfo: nil)
            break
            
        default:
            self.navigationController?.pushViewController(viewController.get(), animated: animated)
            break
        }
    }
}
