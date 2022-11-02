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
    case FirstViewController = "FirstViewController"
    case SecondViewController = "SecondViewController"
    case ThirdViewController = "ThirdViewController"
    case FourthViewController = "FourthViewController"
    case FifthViewController = "FifthViewController"
    
    func get() -> UIViewController {
        switch self {
        case .FirstViewController,
                .SecondViewController,
                .ThirdViewController,
                .FourthViewController,
                .FifthViewController:
            let storyboard = StoryBoard.Main.get()
            return storyboard.instantiateViewController(withIdentifier: self.rawValue)
        }
    }
}
