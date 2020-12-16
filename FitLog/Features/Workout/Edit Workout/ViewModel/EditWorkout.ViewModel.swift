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
                        setAndRep: [Data.Exercise.setAndRep(set: 1, rep: 8),Data.Exercise.setAndRep(set: 2, rep: 8)],
                        weight: 200)
                ],
                muscleGroup: .Chest)
        
    }
}

