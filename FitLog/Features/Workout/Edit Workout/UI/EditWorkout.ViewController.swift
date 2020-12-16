//
//  EditWorkout.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Workout.Edit {

    class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        let viewModel = Workout.Edit.ViewModel()

        private var _view: View!

        public override func loadView() {

            super.loadView()

            let view = View()
            self.view = view
            _view = view
        }

        override func viewDidLoad() {

            _view.workoutTableView.dataSource = self
            _view.workoutTableView.delegate = self

        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return Workout.Edit.TableHeader()

        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.testData.exercises.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! Workout.Edit.View.Cell
            let workout = viewModel.testData.exercises[indexPath.row]
            cell.exerciseNameLabel.text = workout.name
            cell.repsLabel.text = "\(workout.setAndRep?[indexPath.row].rep)"
            cell.setsLabel.text = "\(workout.setAndRep?[indexPath.row].set)"
            return cell
        }
    }
}
