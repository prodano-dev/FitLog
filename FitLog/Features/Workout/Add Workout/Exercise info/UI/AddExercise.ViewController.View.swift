//
//  AddExercise.ViewController.View.swift
//  FitLog
//
//  Created by Danny Prodanovic on 15/12/2020.
//

import UIKit

extension Workout.Add.Exercise {

    class View: UIView {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            addSubview(exerciseTableView)

            //
            // Layout
            //
            let views = ["exerciseTableView":exerciseTableView]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(0)-[exerciseTableView]-(0)-|", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "V:|-(0)-[exerciseTableView]-(0)-|", options: [], metrics: nil, views: views))


        }

        public let exerciseTableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
            tableView.register(Workout.Add.Exercise.View.Cell.self, forCellReuseIdentifier: "ExerciseCell")
            return tableView
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class FooterView: UIView {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            addSubview(addButton)

            self.frame.size.width = UIScreen.main.bounds.width

            //
            // Layout
            //
            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: addButton, attribute: .centerX, relatedBy: .equal,
                toItem: self,
                attribute: .centerX, multiplier: 1.0, constant: 0),
                                         NSLayoutConstraint.init(
                item: addButton, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
        }

        public let addButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("ADD SET", for: .normal)
            button.titleLabel?.tintColor = UIColor(named: "DPWhite")
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            button.backgroundColor = UIColor(named: "DPBlue")
            button.layer.cornerRadius = 20
            button.layer.masksToBounds = true
            button.contentEdgeInsets = UIEdgeInsets(top: 16.0 - 16.0 / 3.0, left: 16.0 - 16.0 / 3.0, bottom: 16.0 - 16.0 / 3.0 , right: 16.0 - 16.0 / 3.0)
            return button
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
