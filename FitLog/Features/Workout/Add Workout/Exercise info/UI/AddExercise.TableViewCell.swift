//
//  AddExercise.TableViewCell.swift
//  FitLog
//
//  Created by Danny Prodanovic on 15/12/2020.
//

import UIKit

extension Workout.Add.Exercise.View {

    class Cell: UITableViewCell {

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            contentView.addSubview(repsTextField)
            contentView.addSubview(weightTextField)
            contentView.addSubview(setLabel)

            //
            // Layout
            //
            let views = ["repsTextField": repsTextField,
                         "weightTextField": weightTextField,
                         "setLabel":setLabel
            ]

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: repsTextField, attribute: .centerX, relatedBy: .equal,
                toItem: self,
                attribute: .centerX, multiplier: 1.0, constant: -25),
                                         NSLayoutConstraint.init(
                item: repsTextField, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0),
                                         NSLayoutConstraint.init(
                item: weightTextField, attribute: .centerX, relatedBy: .equal,
                toItem: self,
                attribute: .centerX, multiplier: 1.0, constant: 25),
                                        NSLayoutConstraint.init(
                item: weightTextField, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0),
            ])

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[repsTextField(20)]", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[weightTextField(20)]", options: [], metrics: nil, views: views))

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[setLabel]", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[setLabel]", options: [], metrics: nil, views: views))

        }

        public let repsTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.keyboardType = .numberPad
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "DPBrown")?.cgColor
            return textField
        }()

        public let weightTextField: UITextField = {
            let textField = UITextField()
            textField.keyboardType = .numberPad
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "DPBrown")?.cgColor
            return textField
        }()

        public let setLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor(named: "DPBlue")
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor(named: "DPWhite")
            return label
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
