//
//  ViewControllerType.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/02.
//

import Foundation
import UIKit

private enum StoryBoard: String {
    case Main = "Main"
    
    func get() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

enum ViewController: String {
    case RootViewController = "RootViewController"
    case FirstViewController = "FirstViewController"
    case SecondViewController = "SecondViewController"
    case ThirdViewController = "ThirdViewController"
    case FourthViewController = "FourthViewController"
    case FifthViewController = "FifthViewController"
    case SixthViewController = "SixthViewController"
    
    func get() -> UIViewController {
        switch self {
        case .RootViewController,
                .FirstViewController,
                .SecondViewController,
                .ThirdViewController,
                .FourthViewController,
                .FifthViewController,
                .SixthViewController:
            let storyboard = StoryBoard.Main.get()
            let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue)
            
            return viewController
        }
    }
}
