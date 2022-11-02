//
//  UIViewExtension.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import Foundation
import UIKit

extension UIViewController {
    func startViewController(_ viewController: ViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController.get(), animated: animated)
    }
    
    func finish(_ animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
}
