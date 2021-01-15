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
                withVisualFormat: "V:|-(0)-[workoutCollection]-(0)-|",
                options:[], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate([NSLayoutConstraint.init(item: workoutCollection, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0)])
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

        public let tableView: UITableView = {
            let tableview = UITableView()
            tableview.translatesAutoresizingMaskIntoConstraints = false
            tableview.register(Home.View.TableViewCell.self,
                               forCellReuseIdentifier: "Cell")
            return tableview
        }()
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
