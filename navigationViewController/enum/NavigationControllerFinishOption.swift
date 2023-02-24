//
//  NavigationControllerFinishOption.swift
//
//  Created by 김경환 on 2022/11/02.
//

import Foundation

enum NavigationControllerFinishOption {
    case popViewController          // 일반 pop
    case popToViewController        // 목적지 viewController 까지 pop
    case popToRootViewController    // index 0 번 viewController 까지 pop
}
