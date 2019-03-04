//
//  YellowViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/28/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    weak var delegate: SwitchControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Yellow view did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Yellow view will appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Yellow view will disappear")
    }
    
    @IBAction func showBlueButtonClicked(_ sender: Any) {
        delegate?.moveToBlue()
    }
}
