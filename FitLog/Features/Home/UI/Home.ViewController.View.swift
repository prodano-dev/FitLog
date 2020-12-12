//
//  Home.ViewController.View.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Home {

    class View: UIView {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            addSubview(workoutCollection)
            backgroundColor = .systemBackground

            //
            // Layout
            //
            let views = ["workoutCollection":workoutCollection]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(0)-[workoutCollection]-(0)-|",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(100)-[workoutCollection]-(0)-|",
                options:[], metrics: nil, views: views)
            )
        }

        public let workoutCollection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 15
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(Home.View.Cell.self, forCellWithReuseIdentifier: "Cell")
            collectionView.backgroundColor = .systemBackground
            return collectionView
        }()
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
