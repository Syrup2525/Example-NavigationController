//
//  UIViewControllerExtension.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/08.
//

import Foundation
import UIKit

extension UIViewController {
    /// 이전 뷰 컨트롤러 찾기
    func getPreviousViewController() -> UIViewController? {
        if let presentingViewController = self.presentingViewController {
            if let navigationController = presentingViewController as? UINavigationController {
                return navigationController.viewControllers.last
            } else if let pageViewController = presentingViewController as? UIPageViewController {
                return pageViewController.viewControllers?.first
            } else {
                return presentingViewController
            }
        } else {
            guard
                let rootViewController = UIApplication.shared.windows.first?.rootViewController
            else {
                return nil
            }
            
            if let navigationViewController = rootViewController as? UINavigationController {
                let count = navigationViewController.viewControllers.count
                
                if count > 1 {
                    return navigationViewController.viewControllers[count - 2]
                } else {
                    return nil
                }
            }
            
            return nil
        }
    }
    
    func getCurrentViewControllerType() -> ViewControllerType {
        guard
            let rootViewController = UIApplication.shared.windows.first?.rootViewController
        else {
            return .viewController
        }
        
        var lastViewController: UIViewController? = rootViewController
        
        // 마지막으로 presentedViewController 된 viewController 탐색
        if let viewController = rootViewController.presentedViewController {
            lastViewController = viewController
            
            while lastViewController != nil {
                lastViewController = lastViewController?.presentedViewController
            }
        }
        
        if lastViewController is UINavigationController {
            return .navigationViewController
        } else if lastViewController is UIPageViewController {
            return .pageViewController
        } else {
            return .viewController
        }
    }
}
