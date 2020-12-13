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

            addSubview(workoutNameTextField)
//            addSubview(muscleGroupPicker)

            backgroundColor = .systemBackground

            //
            // Layout
            //
            let views = ["workoutNameTextField": workoutNameTextField, "muscleGroupPicker": muscleGroupPicker]

//            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
//                                            withVisualFormat: "V:|[workoutNameTextField]-(10)-[muscleGroupPicker]", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(20)-[workoutNameTextField]-(50)-|", options: [], metrics: nil, views: views))

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                                            item: workoutNameTextField, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 24)])


        }

        public let workoutNameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Workout name"
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.autocapitalizationType = .allCharacters
            return textField
        }()

        public let muscleGroupPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
