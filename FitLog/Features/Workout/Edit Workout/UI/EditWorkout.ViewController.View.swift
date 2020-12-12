//
//  EditWorkout.ViewController.View.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Workout.Edit {

    class View: UIView {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            topImageView.addSubview(tintView)
            topImageView.addSubview(workoutNameLabel)
            addSubview(topImageView)
            addSubview(stackView)
            addSubview(workoutTableView)
            addSubview(startButton)

            backgroundColor = .systemBackground

            //
            // Layout
            //
            let views = ["topImageView": topImageView, "workoutNameLabel": workoutNameLabel,"stackView": stackView,
                         "startButton":startButton, "tintView": tintView, "workoutTableView": workoutTableView ]


            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(0)-[tintView]-(0)-|",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(0)-[tintView]-(0)-|",
                options:[], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                  withVisualFormat: "H:|-(0)-[topImageView]-(0)-|",
                  options: [], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                  withVisualFormat: "H:|-(0)-[workoutTableView]-(0)-|",
                  options: [], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                  withVisualFormat: "V:|[topImageView(200)]-(15)-[stackView]-(20)-[workoutTableView]-(10)-[startButton]-(25)-|",
                  options: [], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                  withVisualFormat: "H:|-(25)-[workoutNameLabel]",
                  options: [], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                  withVisualFormat: "V:[workoutNameLabel]-(15)-|",
                  options: [], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                  withVisualFormat: "H:|-(50)-[startButton]-(50)-|",
                  options: [], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: stackView, attribute: .left,
                relatedBy: .equal,
                toItem: workoutNameLabel, attribute: .left, multiplier: 1.0, constant: 0)
                ]
            )

        }

        public let topImageView: UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 50
            view.contentMode = .scaleToFill
            view.layer.masksToBounds = true
            view.layer.maskedCorners = [.init(rawValue: 12)]
            view.image = UIImage(named: "benchpress")
            return view
        }()
        private let tintView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(named: "DPGray")?.withAlphaComponent(0.38)
            return view
        }()

        public let workoutNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textColor = UIColor(named: "DPWhite")
            label.text = "PUSH A"
            return label
        }()

        public let muscleGroupLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            label.textColor = UIColor(named: "DPBrown")
            label.text = "Muscle group: Chest"
            return label
        }()

        public let totalExerciseLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .light)
            label.textColor = UIColor(named: "DPBrown")
            label.text = "Total exercises: 9"
            return label
        }()

        private lazy var stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [muscleGroupLabel, totalExerciseLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 3
            return stack
        }()

        public let startButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("START", for: .normal)
            button.titleLabel?.tintColor = UIColor(named: "DPWhite")
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            button.backgroundColor = UIColor(named: "DPBlue")
            button.layer.cornerRadius = 20
            button.layer.masksToBounds = true
            button.contentEdgeInsets = UIEdgeInsets(top: 16.0 - 16.0 / 3.0, left: 16.0 - 16.0 / 3.0, bottom: 16.0 - 16.0 / 3.0 , right: 16.0 - 16.0 / 3.0)
            return button
        }()

        public let workoutTableView: UITableView = {
            let table = UITableView()
            table.translatesAutoresizingMaskIntoConstraints = false
            table.register(Workout.Edit.View.Cell.self, forCellReuseIdentifier: "TableCell")
            table.layer.borderWidth = 2
            table.layer.borderColor = UIColor(named: "DPBrown")?.cgColor
            return table
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class TableHeader: UIView {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            addSubview(exerciseNameLabel)
            addSubview(repLabel)
            addSubview(setLabel)

            backgroundColor = UIColor(named: "DPBrown")

            //
            // Layout
            //
            let views = ["exerciseNameLabel": exerciseNameLabel, "repLabel":repLabel, "setLabel": setLabel ]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(10)-[exerciseNameLabel]-(5)-[repLabel]-(5)-[setLabel]-(5)-|", options: [], metrics: nil, views: views))

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: exerciseNameLabel, attribute: .centerY,
                relatedBy: .equal,
                toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
                ]
            )

        }

        public let exerciseNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textColor = UIColor(named: "DPWhite")
            label.text = "EXERCISE"
            return label
        }()

        public let repLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            label.textColor = UIColor(named: "DPWhite")
            label.text = "REPS"
            return label
        }()

        public let setLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            label.textColor = UIColor(named: "DPWhite")
            label.text = "SETS"
            return label
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
