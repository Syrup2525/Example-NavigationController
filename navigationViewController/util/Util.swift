//
//  Util.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/04.
//

import Foundation
import UIKit

class Util {
    public static func getPreviousViewController() -> UIViewController? {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return nil }
        
        /// 현재 보여지는 뷰가 navigationController 인 경우
        if let navigationController = rootViewController as? UINavigationController {
            let viewControllers = navigationController.viewControllers
            
            let count = viewControllers.count - 2
            
            if count < 0 { return nil }
            
            return viewControllers[count]
        } else if let presentedViewController = rootViewController.presentedViewController {
            return presentedViewController
        }
        
        return nil
    }
    
//    public static func getVisibleViewController() -> UIViewController? {
//
//    }
}
