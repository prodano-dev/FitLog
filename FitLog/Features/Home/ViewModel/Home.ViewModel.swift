//
//  Home.ViewModel.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Home {

    class ViewModel: NSObject {

        struct Cell {
            var image: String
            var workoutname: String
            var group: String
            var amount: Int
        }

        public let celldata = [
            Cell(image: "benchpress", workoutname: "PUSH A", group: "Chest", amount: 8),
            Cell(image: "back", workoutname: "PULL A", group: "Back", amount: 8),
            Cell(image: "squat", workoutname: "LEGS A", group: "Legs", amount: 8),
            Cell(image: "benchpress", workoutname: "PUSH A", group: "Chest", amount: 8)
        ]
    }
}
