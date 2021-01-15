//
//  Home.ViewController.View.CollectionCell.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Home.View {

    class Cell: UICollectionViewCell {

        override init(frame: CGRect) {
            super.init(frame: .zero)

            addSubview(backgroundImage)
            contentView.addSubview(tintView)
            contentView.addSubview(workoutNameLabel)
            contentView.addSubview(stackView)
            contentView.addSubview(startButton)


            layer.cornerRadius = 25
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2.0)
            layer.shadowRadius = 5.0
            layer.shadowOpacity = 0.59
            layer.masksToBounds = false

            //
            // Layout
            //
            let views = [
                        "workoutNameLabel": workoutNameLabel,
                         "muscleGroupLabel": muscleGroupLabel,
                         "totalExcersissesLabel": totalExcersissesLabel,
                         "startButton": startButton,
                        "backgroundImage": backgroundImage,
                        "tintView": tintView,
                "stackView": stackView
            ]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(0)-[backgroundImage]-(0)-|",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(0)-[backgroundImage]-(0)-|",
                options:[], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(0)-[tintView]-(0)-|",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(0)-[tintView]-(0)-|",
                options:[], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(10)-[workoutNameLabel]",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(10)-[workoutNameLabel]",
                options:[], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(10)-[stackView]",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[stackView]-(10)-|",
                options:[], metrics: nil, views: views)
            )

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "H:[startButton]-(10)-|",
                options:[], metrics: nil, views: views)
            )
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[startButton]-(10)-|",
                options:[], metrics: nil, views: views)
            )
        }

        public let workoutNameLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor(named: "DPWhite")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 24)
            return label
        }()

        public let muscleGroupLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: "DPWhite")
            label.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
            return label
        }()

        public let totalExcersissesLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor(named: "DPWhite")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "HelveticaNeue-Regular", size: 13)
            return label
        }()

        private lazy var stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [muscleGroupLabel, totalExcersissesLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 3
            return stack
        }()

        public let backgroundImage: UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleToFill
            view.layer.cornerRadius = 25
            view.layer.masksToBounds = true
            view.image = UIImage(named: "benchpress")
            view.backgroundColor = .green
            return view
        }()
        private let tintView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 25
            view.layer.masksToBounds = true
            view.backgroundColor = UIColor(named: "DPGray")?.withAlphaComponent(0.38)
            return view
        }()

        public let startButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("START", for: .normal)
            button.titleLabel?.tintColor = UIColor(named: "DPWhite")
            button.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 17)
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
