//
//  BaseViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class BaseViewController: UIViewController {
    final var backButton: UIButton?
    
    final private var requestCode: Int?
    final private var reverseRequestCode: Int?
    final private var resultCode: ResultCode?
    final private var resultData: [String:Any]?
    private var senderData: [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBackButton()
    }
    
    /// 뒤로가기 버튼 생성
    final private func initBackButton() {
        guard
            let count = navigationController?.viewControllers.count
        else {
            return
        }
        
        if count > 2 {
            let backButton = UIButton()
            self.view.addSubview(backButton)
            
            guard let window = UIApplication.shared.windows.first else { return }
            
            let top = window.safeAreaInsets.top + 15
            let left = window.safeAreaInsets.left + 18
            
            backButton.translatesAutoresizingMaskIntoConstraints = false
            
            backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: top).isActive = true
            backButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: left).isActive = true
            
            backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            backButton.tintColor = #colorLiteral(red: 0.2605186105, green: 0.2605186105, blue: 0.2605186105, alpha: 1)
            
            self.backButton = backButton
            
            self.backButton?.addTarget(self, action: #selector(onClickBackButton), for: .touchUpInside)
        }
    }
    
    @objc func onClickBackButton(_ sender: UIButton) {
        onBackPress()
    }
    
    func onBackPress() {
        finish()
    }
    
    final func finish(_ animated: Bool = true, option: FinishOption = .popViewController, specifiedViewController: ViewController? = nil) {
        guard
            let rootViewController = UIApplication.shared.windows.first?.rootViewController
        else {
            return
        }
        
        /// 현재 보여지는 뷰가 navigationController 인 경우
        if let navigationController = rootViewController as? UINavigationController {
            // onViewControllerResult 실행
            let viewControllers = navigationController.viewControllers
            let count = viewControllers.count - 2
            let previousViewController = viewControllers[count]
            
            if let previousViewController = previousViewController as? OnViewControllerResult {
                previousViewController.onViewControllerResult(requestCode: requestCode, resultCode: resultCode, data: resultData)
            }
            
            // pop 실행
            switch option {
            case .popViewController:
                navigationController.popViewController(animated: animated)
                break
                
            case .popToViewController:
                let viewControllerStack = navigationController.viewControllers
                
                for item in viewControllerStack {
                    if "\(type(of: item))" == specifiedViewController?.rawValue {
                        navigationController.popToViewController(item, animated: animated)
                    }
                }
                break
                
            case .popToRootViewController:
                navigationController.popToRootViewController(animated: animated)
                break
            }
        }
        
        /// 현재 보여지는 뷰가 presentedViewController 인 경우
        if let presentedViewController = rootViewController.presentedViewController {
            // dismiss 실행 후 onViewControllerResult 실행
            presentedViewController.dismiss(animated: animated) {
                if let viewController = presentedViewController as? OnViewControllerResult {
                    viewController.onViewControllerResult(requestCode: self.requestCode, resultCode: self.resultCode, data: self.resultData)
                }
            }
        }
    }
    
    final func setResult(resultCode: ResultCode, data: [String:Any]? = nil) {
        self.resultCode = resultCode
        self.resultData = data
    }
}
