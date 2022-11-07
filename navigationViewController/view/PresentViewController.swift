//
//  PresentViewController.swift
//  navigationViewController
//
//  Created by 김경환 on 2022/11/04.
//

import UIKit

class PresentViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickSecondPresent(_ sender: UIButton) {
        startViewController(.SecondPresentViewController, option: .present)
    }
    
    @IBAction func onClickFinish(_ sender: UIButton) {
        finish()
    }
}
