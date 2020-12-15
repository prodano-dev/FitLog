//
//  AddWorkout.ViewController.View.swift
//  FitLog
//
//  Created by Danny Prodanovic on 13/12/2020.
//

import UIKit

extension Workout.Add {

    class View: UIView {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            muscleGroupTextField.inputView = muscleGroupPicker

            addSubview(workoutNameTextField)
//            addSubview(muscleGroupPicker)
            addSubview(stackView)
            addSubview(exerciseTableView)
            addSubview(muscleGroupTextField)

            backgroundColor = .systemBackground

            //
            // Layout
            //
            let views = ["workoutNameTextField": workoutNameTextField,
                         "muscleGroupPicker": muscleGroupPicker,
                         "stackView": stackView,
                         "exerciseNameTextField": exerciseNameTextField,
                         "addButton": addButton,
                         "exerciseTableView": exerciseTableView, "muscleGroupTextField":muscleGroupTextField
            ]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "V:[workoutNameTextField]-(10)-[muscleGroupTextField]-(5)-[stackView]-(5)-[exerciseTableView]-(5)-|", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(20)-[workoutNameTextField]-(50)-|", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(20)-[stackView]-(50)-|", options: [], metrics: nil, views: views))

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(0)-[exerciseTableView]-(0)-|", options: [], metrics: nil, views: views))

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                                            item: workoutNameTextField, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 24),
                                         NSLayoutConstraint.init(
                                              item: muscleGroupTextField, attribute: .left, relatedBy: .equal, toItem: workoutNameTextField, attribute: .left, multiplier: 1.0, constant: 0)
            ])


        }

        public let workoutNameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Workout name"
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocapitalizationType = .allCharacters
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "DPBlue")?.cgColor
            return textField
        }()

        public let muscleGroupPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()

        public let muscleGroupTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Muscle group"
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocapitalizationType = .allCharacters
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "DPBlue")?.cgColor
            return textField
        }()

        public let exerciseNameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Exercise.."
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocapitalizationType = .allCharacters
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "DPBlue")?.cgColor
            textField.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            return textField
        }()

        public let addButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("ADD", for: .normal)
            button.titleLabel?.tintColor = UIColor(named: "DPWhite")
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            button.backgroundColor = UIColor(named: "DPBlue")
            button.layer.cornerRadius = 5
            button.layer.masksToBounds = true
            button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            button.contentEdgeInsets = UIEdgeInsets(top: 16.0 - 16.0 / 3.0, left: 16.0 - 16.0 / 3.0, bottom: 16.0 - 16.0 / 3.0 , right: 16.0 - 16.0 / 3.0)
            return button
        }()

        private lazy var stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [exerciseNameTextField, addButton])
            stack.axis = .horizontal
            stack.spacing = 2
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()

        public let exerciseTableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tableView
        }()


        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
