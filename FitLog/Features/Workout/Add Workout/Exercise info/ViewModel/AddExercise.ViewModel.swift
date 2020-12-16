//
//  AddExercise.ViewModel.swift
//  FitLog
//
//  Created by Danny Prodanovic on 16/12/2020.
//

import UIKit

extension Workout.Add.Exercise {

    class ViewModel: NSObject {

        public var workout: Data.Workout

        public init(workout: Data.Workout) {
            self.workout = workout

            super.init()
        }
    }
}
