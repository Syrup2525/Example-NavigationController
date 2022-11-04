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
    public static func getPreviousViewController() -> UIViewController? {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return nil }
        
        // 현재 보여지는 뷰가 navigationController 인 경우
        if let navigationController = rootViewController as? UINavigationController {
            let viewControllers = navigationController.viewControllers
            
            let count = viewControllers.count - 2
            
            // 혹시나 모를 음수 인덱스 진입 방지
            if count < 0 { return nil }
            
            return viewControllers[count]
        // 현재 보여지는 뷰가 presentedViewController 인 경우
        } else if let presentedViewController = rootViewController.presentedViewController {
            return presentedViewController
        }
        
        return nil
    }
    
//    public static func getVisibleViewController() -> UIViewController? {
//
//    }
}
