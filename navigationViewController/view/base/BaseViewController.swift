//
//  BaseViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class BaseViewController: UIViewController {
    final private var indicator: UIActivityIndicatorView!
    
    final var backButton: UIButton?
    
    final var requestData: [String:Any]?
    final var requestCode: Int?
    final var resultCode: ResultCode?
    final var resultData: [String:Any]?
    final var onViewControllerResult: ((Int?, ResultCode?, [String:Any]?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBackButton()
        initIndicator()
    }
    
    /// 뒤로가기 버튼 생성
    final private func initBackButton() {
        guard
            let count = navigationController?.viewControllers.count
        else {
            return
        }
        
        if count > Application.NAVIGATION_START_INDEX + 1 {
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
    
    final private func initIndicator() {
        indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        indicator.backgroundColor = .clear
        indicator.hidesWhenStopped = false
        indicator.style = .large
        indicator.startAnimating()
        self.view.addSubview(indicator)
        indicator.isHidden = true
    }
    
    @objc private func onClickBackButton(_ sender: UIButton) {
        onBackPress()
    }
    
    func onBackPress() {
        finish()
    }
    
    /// 다음 뷰 컨트롤러
    final func startViewController(_ viewController: ViewController,
                                   animated: Bool = true,
                                   option: StartViewControllerOption) {
        switch option {
        case .clearTop:
            var object = [String:Any]()
            object.updateValue(viewController, forKey: "viewController")
            object.updateValue(animated, forKey: "animated")
            
            if let requestData = requestData {
                object.updateValue(requestData, forKey: "requestData")
            }
            
            NotificationCenter.default.post(name: .viewControllerClearTop, object: object, userInfo: nil)
            break
            
        case .present:
            if let viewController = viewController.get() as? BaseViewController {
                viewController.requestData = requestData
                
                self.present(viewController, animated: animated)
            } else {
                self.present(viewController.get(), animated: animated)
            }
            break
            
        case .push:
            self.navigationController?.pushViewController(viewController.get(), animated: animated)
            break
        }
    }
    
    final func finish(_ animated: Bool = true, option: NavigationControllerFinishOption = .popViewController, specifiedViewController: ViewController? = nil) {
        guard
            let previousViewController = getPreviousViewController() as? BaseViewController
        else {
            return
        }
        
        switch getCurrentViewControllerType() {     // 현재 보여지고 있는 뷰 컨트롤러 타입이
        case .navigationViewController: // 네비게이션 뷰 컨틀로러인 경우
            let requestCode = previousViewController.requestCode
            previousViewController.onViewControllerResult?(requestCode, resultCode, resultData)
            
            guard let navigationController = previousViewController.navigationController else { return }
            
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
            break
            
        case .viewController, .pageViewController:
            self.dismiss(animated: animated) {
                let requestCode = previousViewController.requestCode
                previousViewController.onViewControllerResult?(requestCode, self.resultCode, self.resultData)
            }
            break
        }
    }
    
    final func setOnViewControllerResult(onViewControllerResult: ((Int?, ResultCode?, [String:Any]?) -> ())?) {
        self.onViewControllerResult = onViewControllerResult
    }
    
    final public func showIndicator(isBakcgroundVisible: Bool = true) {
        if isBakcgroundVisible {
            indicator.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        } else {
            indicator.backgroundColor = .clear
        }
        
        indicator.isHidden = false
    }
    
    final public func dismissIndicator() {
        indicator.isHidden = true
    }
    
    /// dismiss 메서드 사용 금지 (finish 메서드를 사용하도록 유도)
    final override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) { }
}
