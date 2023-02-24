//
//  UIViewControllerExtension.swift
//  navigationController
//
//  Created by 김경환 on 2022/11/08.
//

import Foundation
import UIKit

extension UIViewController {
    /// 이전 뷰 컨트롤러 찾기
    func getPreviousViewController() -> UIViewController? {
        var viewController: UIViewController?
        
        // presentingViewController 가 존재 한다면
        if let presentingViewController = self.presentingViewController {
            // presentingViewController 가 UINavigationController 인 경우
            if let navigationController = presentingViewController as? UINavigationController {
                viewController = navigationController.viewControllers.last
            // presentingViewController 가 pageViewController 인 경우
            } else if let pageViewController = presentingViewController as? UIPageViewController {
                viewController = pageViewController.viewControllers?.first
            // MARK: TabViewController 사용시 추가 로직 필요
            } else {
                viewController = presentingViewController
            }
        // presentingViewController 가 존재하지 않는다면 현재 뷰컨트롤러가 최상위 뷰 컨트롤러
        } else {
            // MARK: rootViewController 가 navigationViewController 라고 가정, 아닐 경우 추가 로직 필요
            guard
                let rootViewController = UIApplication.shared.windows.first?.rootViewController,
                let navigationController = rootViewController as? UINavigationController
            else {
                return nil
            }
            
            let count = navigationController.viewControllers.count - 2
            
            viewController = navigationController.viewControllers[count]
        }
        
        return viewController
    }
    
    /// 현재 뷰컨트롤러 타입 찾기
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
