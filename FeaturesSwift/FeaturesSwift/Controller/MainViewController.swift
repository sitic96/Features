//
//  ViewController.swift
//  FeaturesSwift
//
//  Created by Sitora Guliamova on 2/19/19.
//  Copyright © 2019 Sitora Guliamova. All rights reserved.
//  Source: https://medium.com/@satindersingh71/infinite-uicollectionview-b706c939ed3c

import UIKit

class MainViewController: UIViewController {

    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private var colorsArray = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 0.9297412569, blue: 0.8718347899, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9297412569, blue: 0.8718347899, alpha: 1)

        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "ColorCell")

        colorsArray.append(.yellow)
        colorsArray.append(.red)
        colorsArray.append(.green)
        colorsArray.append(.purple)
        colorsArray.append(.magenta)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let cellSize = CGSize(width: collectionView.frame.width - 80 , height: collectionView.frame.height)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        collectionView.setCollectionViewLayout(layout, animated: true)

        collectionView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        let midIndexPath = IndexPath(row: 100 / 2, section: 0)
        collectionView.scrollToItem(at: midIndexPath,
                                         at: .centeredHorizontally,
                                         animated: false)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemToShow = colorsArray[indexPath.row % colorsArray.count]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        cell.backgroundColor = itemToShow
        cell.layer.cornerRadius = 10
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
}

class ColorCell: UICollectionViewCell {

}
