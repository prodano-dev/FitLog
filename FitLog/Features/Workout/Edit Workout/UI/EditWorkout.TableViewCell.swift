//
//  EditWorkout.TableViewCell.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Workout.Edit.View {

    internal class Cell: UITableViewCell {

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            contentView.addSubview(exerciseNameLabel)
            contentView.addSubview(repsLabel)
            contentView.addSubview(setsLabel)


            //
            // Layout
            //
            let views = ["exerciseNameLabel": exerciseNameLabel, "repsLabel": repsLabel, "setsLabel": setsLabel
            ]

            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                                            withVisualFormat: "H:|-(5)-[exerciseNameLabel]-(5)-[repsLabel]-(5)-[setsLabel]-|", options: [], metrics: nil, views: views))



        }


        public let exerciseNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            return label
        }()

        public let repsLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()

        public let setsLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return label
        }()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
