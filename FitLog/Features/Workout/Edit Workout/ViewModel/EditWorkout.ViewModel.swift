//
//  EditWorkout.ViewModel.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Workout.Edit {

    class ViewModel: NSObject {

        public let testData =
            Data.Workout(
                workoutName: "PUSH A",
                exercises: [
                    Data.Exercise(
                        name: "Bencpress",
                        set: [
                            Data.Exercise.repAndWeight(rep: 3, weight:8),
                            Data.Exercise.repAndWeight(rep: 7, weight: 8)
                        ]),
                    Data.Exercise(
                        name: "Dumble press",
                        set: [
                            Data.Exercise.repAndWeight(rep: 3, weight:8),
                            Data.Exercise.repAndWeight(rep: 7, weight: 8),
                            Data.Exercise.repAndWeight(rep: 15, weight:8),
                            Data.Exercise.repAndWeight(rep: 12, weight: 8)
                        ]),
                    Data.Exercise(
                        name: "Cable flys",
                        set: [
                            Data.Exercise.repAndWeight(rep: 3, weight:8),
                            Data.Exercise.repAndWeight(rep: 7, weight: 8)
                        ]),
                    Data.Exercise(
                        name: "Pushups",
                        set: [
                            Data.Exercise.repAndWeight(rep: 3, weight:8),
                            Data.Exercise.repAndWeight(rep: 7, weight: 8)
                        ]),
                    Data.Exercise(
                        name: "Rope",
                        set: [
                            Data.Exercise.repAndWeight(rep: 3, weight:8),
                            Data.Exercise.repAndWeight(rep: 7, weight: 8)
                        ])
                ],
                muscleGroup: .Chest)
        
    }
}

