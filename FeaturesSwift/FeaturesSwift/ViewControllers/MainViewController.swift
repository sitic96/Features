//
//  MainViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/28/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//
// https://cocoacasts.com/managing-view-controllers-with-container-view-controllers

import UIKit

class MainViewController: UIViewController {

    private enum AvailableVCs {
        case blue
        case yellow
    }

    private var currentViewController = AvailableVCs.yellow

    private lazy var yellowVC: YellowViewController = {
        let yellowController = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        yellowController.view.frame = CGRect(x: view.frame.minX,
                                             y: view.frame.maxY - view.frame.height/3,
                                             width: view.frame.width,
                                             height: view.frame.height/3)
        self.add(asChildViewController: yellowController)
        return yellowController
    }()

    private lazy var blueVC: BlueViewController = {
        let blueController = storyboard?.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        blueController.view.frame = CGRect(x: view.frame.minX,
                                           y: view.frame.maxY - view.frame.height/2,
                                           width: view.frame.width,
                                           height: view.frame.height/2)
        self.add(asChildViewController: blueController)
        return blueController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func switchVCsButtonClicked(_ sender: UIButton) {
        setupView()
    }

    private func setupView() {
        switch currentViewController {
        case .yellow:
            remove(asChildViewController: yellowVC)
            add(asChildViewController: blueVC)
            currentViewController = .blue
        case .blue:
            remove(asChildViewController: blueVC)
            add(asChildViewController: yellowVC)
            currentViewController = .yellow
        }
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

