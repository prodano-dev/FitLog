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
            contentView.addSubview(xLabel)

            //
            // Layout
            //
            let views = ["repsTextField": repsTextField,
                         "weightTextField": weightTextField,
                         "setLabel":setLabel,
                         "xLabel": xLabel
            ]

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: repsTextField, attribute: .centerX, relatedBy: .equal,
                toItem: self,
                attribute: .centerX, multiplier: 1.0, constant: -35),
                                         NSLayoutConstraint.init(
                item: repsTextField, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0),
                                         NSLayoutConstraint.init(
                item: weightTextField, attribute: .centerX, relatedBy: .equal,
                toItem: self,
                attribute: .centerX, multiplier: 1.0, constant: 35),
                                        NSLayoutConstraint.init(
                item: weightTextField, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0),
                                        NSLayoutConstraint.init(
                item: xLabel, attribute: .centerX, relatedBy: .equal,
                toItem: self,
                attribute: .centerX, multiplier: 1.0, constant: 0),
                                        NSLayoutConstraint.init(
                item: xLabel, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0),
            ])

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[setLabel(25)]", options: [], metrics: nil, views: views))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[setLabel(25)]", options: [], metrics: nil, views: views))
        }

        public let repsTextField: TextField = {
            let textField = TextField()
            textField.textField.keyboardType = .numberPad
            textField.placeHolder = "Reps"
            textField.textField.textAlignment = .center
            return textField
        }()

        public let weightTextField: TextField = {
            let textField = TextField()
            textField.textField.keyboardType = .numberPad
            textField.placeHolder = "Weight"
            textField.textField.textAlignment = .center
            return textField
        }()

        private let xLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "X"
            label.textColor = UIColor(named: "DPBlue")
            return label
        }()

        public let setLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor(named: "DPBlue")
            label.font = UIFont.systemFont(ofSize: 15)
            label.textAlignment = .center
            label.textColor = UIColor(named: "DPWhite")
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 25 / 2
            return label
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
