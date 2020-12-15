//
//  AddWorkout.ViewModel.swift
//  FitLog
//
//  Created by Danny Prodanovic on 13/12/2020.
//

import UIKit

extension Workout.Add {

    class ViewModel: NSObject {

        public lazy var pickerViewData: [String] = {
            var data: [String] = []
            Data.Workout.MuscleGroup.allCases.map({
                data.append($0.muscleGroupName)
            })
            return data
        }()

        public var exercises = [String]()
    }
}
