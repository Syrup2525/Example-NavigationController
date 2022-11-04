//
//  BaseViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class BaseViewController: UIViewController {
    final var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBackButton()
        
        self.navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleBackswipe))
    }
    
    /// 뒤로가기 버튼 생성
    final private func createBackButton() {
        guard
            let count = navigationController?.viewControllers.count
        else {
            return
        }
        
        if let viewControllers = navigationController?.viewControllers {
            print("")
            
            for viewController in viewControllers {
                print("\(type(of: viewController))")
            }
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
    
    /// 뒤로가기 제스쳐 콜백
    @objc private func handleBackswipe() {
        self.navigationController?.interactivePopGestureRecognizer?.removeTarget(self, action: #selector(handleBackswipe))
        
        onBackPressed(false)
    }
    
    @objc func onClickBackButton(_ sender: UIButton) {
        onBackPressed()
    }
    
    func onBackPressed(_ isFinish: Bool = true) {
        if isFinish {
            finish()
        }
    }
}
