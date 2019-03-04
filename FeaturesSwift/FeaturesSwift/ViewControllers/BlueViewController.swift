//
//  BlueViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/28/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    weak var delegate: SwitchControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Blue view did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Blue view will appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Blue view will disappear")
    }
    
    @IBAction func hideButtonClicked(_ sender: Any) {
        delegate?.backToYellow()
    }
}
