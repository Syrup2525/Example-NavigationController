//
//  OnViewControllerResult.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/04.
//

import Foundation

protocol OnViewControllerResult {
    func onViewControllerResult(requestCode: Int?, resultCode: ResultCode?, data: [String:Any]?)
}
