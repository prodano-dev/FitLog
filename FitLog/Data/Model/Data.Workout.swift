//
//  Data.Workout.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import Foundation

extension Data {

    public struct Workout: Codable {

        let workoutName: String
        let exercises: [Exercise]
        let muscleGroup: String

    }

    public struct Exercise: Codable {
        let name: String
        let rep: Int
        let set: Int
        let weight: Double
    }
}
