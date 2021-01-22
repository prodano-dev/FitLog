//
//  AddWorkout.ViewController.View.Cell.swift
//  FitLog
//
//  Created by Danny Prodanovic on 18/01/2021.
//

import UIKit

extension Workout.Add.View {

    class Cell: UITableViewCell {

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

//            contentView.addSubview(horizontalStackView)
            contentView.addSubview(exerciseNameLabel)
            contentView.addSubview(superSetNameLabel)
            contentView.addSubview(supperSetButton)

            contentView.layer.cornerRadius = 15
            contentView.layer.masksToBounds = true
            contentView.backgroundColor = .systemGray6

            //
            // Layout
            //
            let views = ["exerciseNameLabel": exerciseNameLabel, "superSetNameLabel": superSetNameLabel,
                         "supperSetButton": supperSetButton
            ]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat:"H:|-(10)-[exerciseNameLabel]-(5)-[superSetNameLabel]-(5)-[supperSetButton(==100)]-(10)-|",
                options: [], metrics: nil, views: views))

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: exerciseNameLabel, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0)
            ])

            NSLayoutConstraint.activate([NSLayoutConstraint.init(
                item: supperSetButton, attribute: .centerY, relatedBy: .equal,
                toItem: self,
                attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
        }

        public let exerciseNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()

        public lazy var superSetNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.isHidden = true
            return label
        }()

        public let supperSetButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("SuperSet", for: .normal)
            button.titleLabel?.tintColor = UIColor(named: "DPWhite")
            button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
            button.backgroundColor = UIColor(named: "DPBlue")
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.contentEdgeInsets = UIEdgeInsets(top: 13.0 - 13.0 / 3.0, left: 13.0 - 13.0 / 3.0, bottom: 13.0 - 13.0 / 3.0 , right: 13.0 - 13.0 / 3.0)
            return button
        }()

//        private lazy var horizontalStackView: UIStackView = {
//            let stackView = UIStackView(arrangedSubviews: [exerciseNameLabel, superSetNameLabel])
//            stackView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.axis = .horizontal
//            stackView.spacing = 8
//            return stackView
//        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
