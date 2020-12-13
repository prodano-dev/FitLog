//
//  Data.Workout.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import Foundation

extension Data {

    public struct Workout {

        let workoutName: String
        let exercises: [Exercise]
        let muscleGroup: MuscleGroup

        enum MuscleGroup: CaseIterable {

            case Chest
            case Back
            case Arms
            case Abdominals
            case Legs
            case Shoulders

            var imageName: String {
                switch self {
                case .Chest:
                    return "benchpress"
                case .Back:
                    return "back"
                case .Legs:
                    return "squat"
                default:
                    return "not ready."
                }
            }

            var muscleGroupName: String {
                switch self {
                case .Abdominals:
                    return "Abdominals"
                case .Back:
                    return "Back"
                case .Legs:
                    return "Legs"
                case .Arms:
                    return "Arms"
                case .Chest:
                    return "Chest"
                case .Shoulders:
                    return "Shoulders"
                }
            }
        }
    }

    public struct Exercise {
        let name: String
        let rep: Int
        let set: Int
        let weight: Double?
    }

}
