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

            workoutNameTextField.placeHolder = "WORKOUT NAME"
            exerciseNameTextField.placeHolder = "EXERCISE NAME"

            muscleGroupTextField.inputView = muscleGroupPicker
            addSubview(workoutNameTextField)
//            addSubview(muscleGroupPicker)
            addSubview(exerciseNameTextField)
            addSubview(addButton)
            addSubview(exerciseTableView)
            addSubview(muscleGroupTextField)

            backgroundColor = .systemBackground

            //
            // Layout
            //
            let views = ["workoutNameTextField": workoutNameTextField,
                         "muscleGroupPicker": muscleGroupPicker,
                         "exerciseNameTextField": exerciseNameTextField,
                         "addButton": addButton,
                         "exerciseTableView": exerciseTableView,
                         "muscleGroupTextField":muscleGroupTextField
            ]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
               withVisualFormat:"V:[workoutNameTextField]-(5)-[muscleGroupTextField]-(5)-[exerciseNameTextField]-(5)-[exerciseTableView]-(5)-|",
                options: [], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
               withVisualFormat: "H:|-(20)-[workoutNameTextField]-(50)-|",
               options: [], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
               withVisualFormat: "H:|-(20)-[exerciseNameTextField]-(5)-[addButton(==60)]-(5)-|",
               options: [], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
               withVisualFormat: "H:|-(0)-[exerciseTableView]-(0)-|",
               options: [], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
               item: workoutNameTextField, attribute: .top, relatedBy: .equal,
               toItem: safeAreaLayoutGuide,
               attribute: .top, multiplier: 1.0, constant: 24),
            NSLayoutConstraint.init(
                item: muscleGroupTextField, attribute: .left, relatedBy: .equal,
                toItem: workoutNameTextField,
                attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(
                item: addButton, attribute: .centerY, relatedBy: .equal,
                toItem: exerciseNameTextField,
                attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
        }
        
        public let workoutNameTextField = TextField()
        
        public let muscleGroupPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()

        public let muscleGroupTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "MUSCLE GROUP"
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocapitalizationType = .allCharacters
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "DPBlue")?.cgColor
            textField.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 17)
            return textField
        }()

        public let exerciseNameTextField = TextField()

        public let addButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("ADD", for: .normal)
            button.titleLabel?.tintColor = UIColor(named: "DPWhite")
            button.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 17)
            button.backgroundColor = UIColor(named: "DPBlue")
            button.layer.cornerRadius = 5
            button.layer.masksToBounds = true
            button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//            button.contentEdgeInsets = UIEdgeInsets(top: 10.0 - 10.0 / 3.0, left: 10.0 - 16.0 / 3.0, bottom: 10.0 - 10.0 / 3.0 , right: 10.0 - 10.0 / 3.0)
            return button
        }()

        public let exerciseTableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(Workout.Add.View.Cell.self, forCellReuseIdentifier: "TableCell")
            tableView.separatorStyle = .none
            return tableView
        }()


        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
