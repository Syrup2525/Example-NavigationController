//
//  BaseViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class BaseViewController: UIViewController {
    private var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBackButton()
    }
    
    private func createBackButton() {
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
    }
}
