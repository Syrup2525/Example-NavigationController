//
//  FirstViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/03.
//

import UIKit

class FirstViewController: BaseViewController {
    @IBOutlet var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        startViewController(.SecondViewController)
    }
}

extension FirstViewController: OnViewControllerResult {
    func onViewControllerResult(requestCode: Int?, resultCode: ResultCode?, data: [String : Any]?) {
        guard let resultCode = resultCode else { return }
        
        switch resultCode {
        case .RESULT_OK:
            lbResult.text = ".RESULT_OK"
            break
            
        case .RESULT_CANCEL:
            lbResult.text = ".RESULT_CANCEL"
            break
            
        case .RESULT_FAIL:
            lbResult.text = ".RESULT_FAIL"
            break
        }
    }
}
