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
                                name: "Benchpress",
                                rep: 5, set: 5,
                                weight: 100),
                    Data.Exercise(
                                name: "Incline dumble press",
                                rep: 5, set: 5,
                                weight: 100),
                    Data.Exercise(
                                name: "Shoulder press",
                                rep: 5, set: 5,
                                weight: 100),
                    Data.Exercise(
                                name: "CableFly",
                                rep: 5, set: 5,
                                weight: 100),
                    Data.Exercise(
                                name: "Pushup",
                                rep: 5, set: 5,
                                weight: 100)

                ],
                muscleGroup: .Chest)
        
    }
}

