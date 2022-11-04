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
        
        self.navigationController?.delegate = self
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

extension RootViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges({ (context) in
                // 뒤로가기 제스쳐중 뒤로가기를 취소한 경우 (화면을 옆으로 밀다 만 경우)
                if context.isCancelled { return }
                
                guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else { return }
                
                /* 현재 보여지고 있는 viewController 찾기 */
                var viewController: OnViewControllerResult?
                
                // 현재 보이는 viewController 가 UINavigationController 인 경우
                if let navigationController = rootViewController as? UINavigationController {
                    viewController = navigationController.visibleViewController as? OnViewControllerResult
                // 현재 보이는 viewController 가 presentedViewController 인 경우
                } else if let presentedViewController = rootViewController.presentedViewController {
                    viewController = presentedViewController as? OnViewControllerResult
                }
                
                // 현재 보여지는 viewController onBack closure 실행
                viewController?.onViewControllerResult(requestCode: nil, resultCode: .RESULT_CANCEL, data: nil)
            })
        }
    }
}
