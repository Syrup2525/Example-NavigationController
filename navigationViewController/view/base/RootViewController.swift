//
//  ViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import UIKit

// NavigationController index 0 번째에 해당하는 뷰 컨트롤러
class RootViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(clearTop(_:)), name: .viewControllerClearTop, object: nil)
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.FirstViewController, option: .push)
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
        
        if let viewController = viewController.get() as? BaseViewController {
            let requestData = object["requestData"] as? [String:Any]
            viewController.requestData = requestData
            
            self.navigationController?.pushViewController(viewController, animated: animated)
        } else {
            self.navigationController?.pushViewController(viewController.get(), animated: animated)
        }
    }
}

extension RootViewController: UIGestureRecognizerDelegate {
    /// 뒤로가기 제스처 사용가능 여부
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let count = self.navigationController?.viewControllers.count, count > Application.NAVIGATION_START_INDEX + 1 {
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
                if context.isCancelled {
                    return
                }
                
                /* 뒤로가기 제스쳐 이벤트 */
                guard
                    let viewController = navigationController.visibleViewController as? BaseViewController
                else {
                    return
                }
                
                let requestCode = viewController.requestCode
                viewController.onViewControllerResult?(requestCode, .RESULT_CANCEL, nil)
            })
        }
    }
}
