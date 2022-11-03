//
//  UIViewExtension.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import Foundation
import UIKit

extension UIViewController {
    func startViewController(_ viewController: ViewController, animated: Bool = true, option: StartViewControllerOption? = nil) {
        switch option {
        case .clearTop:
            self.navigationController?.viewControllers = [viewController.get()]
            break
            
        default:
            self.navigationController?.pushViewController(viewController.get(), animated: animated)
            break
        }
    }
    
    func finish(_ animated: Bool = true, option: FinishOption = .popViewController, specifiedViewController: ViewController? = nil) {
        switch option {
        case .popViewController:
            self.navigationController?.popViewController(animated: animated)
            break
            
        case .popToViewController:
            guard
                let viewControllerStack = self.navigationController?.viewControllers
            else {
                return
            }
            
            for item in viewControllerStack {
                if "\(type(of: item))" == specifiedViewController?.rawValue {
                    self.navigationController?.popToViewController(item, animated: animated)
                }
            }
            break
            
        case .popToRootViewController:
            self.navigationController?.popToRootViewController(animated: animated)
            break
        }
    }
}
