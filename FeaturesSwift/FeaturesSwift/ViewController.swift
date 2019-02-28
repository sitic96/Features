//
//  ViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/28/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func resizeButtonClicked(_ sender: UIButton) {
        catImageView.image = #imageLiteral(resourceName: "cat").resize(to: CGSize(width: 100, height: 500))
    }
}

extension UIImage {
    func resize(to targetSize: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)

        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}

