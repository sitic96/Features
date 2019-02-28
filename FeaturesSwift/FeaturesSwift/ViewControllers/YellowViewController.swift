//
//  YellowViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/28/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Yellow view will appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Yellow view will disappear")
    }
}
