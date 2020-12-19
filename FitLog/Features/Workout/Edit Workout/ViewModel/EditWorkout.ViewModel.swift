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
                        set: [Data.Exercise.repAndWeight(rep: 1, weight: 8),Data.Exercise.repAndWeight(rep: 2, weight: 8)])
                ],
                muscleGroup: .Chest)
        
    }
}

