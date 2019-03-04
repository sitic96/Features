//
//  MainViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/28/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private lazy var yellowVC: YellowViewController = {
        let yellowController = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        yellowController.view.frame = CGRect(x: view.frame.minX,
                                             y: view.frame.maxY - view.frame.height/3,
                                             width: view.frame.width,
                                             height: view.frame.height/3)
        self.add(asChildViewController: yellowController)
        yellowController.delegate = self
        return yellowController
    }()

    private lazy var blueVC: BlueViewController = {
        let blueController = storyboard?.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        blueController.view.frame = CGRect(x: view.frame.minX,
                                           y: view.frame.maxY - 448,
                                           width: view.frame.width,
                                           height: 448)
        blueController.delegate = self
        return blueController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        add(asChildViewController: yellowVC)
    }

    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

extension MainViewController: SwitchControllerDelegate {
    func moveToBlue() {
        remove(asChildViewController: yellowVC)
        add(asChildViewController: blueVC)
    }

    func backToYellow() {
        remove(asChildViewController: blueVC)
        add(asChildViewController: yellowVC)
    }
}
