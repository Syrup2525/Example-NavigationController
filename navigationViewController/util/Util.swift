//
//  Util.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/04.
//

import Foundation
import UIKit

class Util {
    /// 이전 뷰 컨트롤러 찾기
    public static func getPreviousViewController(viewController: UIViewController) -> UIViewController? {
        guard
            let rootViewController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController
        else {
            return nil
        }
        
        var viewControllers = [UIViewController]()
        
        if let navigationViewController = rootViewController.viewControllers.last {
            viewControllers.append(navigationViewController)
        }
        
        if let viewController = rootViewController.presentedViewController {
            var topViewController: UIViewController?
            
            topViewController = viewController
            
            while topViewController != nil {
                viewControllers.append(topViewController!)
                topViewController = topViewController?.presentedViewController
            }
        }
        
        let count = viewControllers.count
        
        if count > 1 {
            return viewControllers[count - 2]
        } else {
            return nil
        }
    }
    
    public static func getVisibleViewControllerType(viewController: UIViewController) -> ViewControllerType {
        if let _ = viewController.navigationController {
            return .navigationViewController
        }
        
        return .viewController
    }
}
