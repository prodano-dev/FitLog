//
//  AddExercise.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 15/12/2020.
//

import UIKit

extension Workout.Add.Exercise {

    class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        private let viewModel: ViewModel

        public init(viewModel: ViewModel){

            self.viewModel = viewModel

            super.init(nibName: nil, bundle: nil)

        }


        private var _view: View!

        public override func loadView() {

           super.loadView()

           let view = View()
           self.view = view
           _view = view
        }

        override func viewDidLoad() {

            title = viewModel.workout.workoutName
            let saveButton = UIBarButtonItem(
                title: "Save",
                style: .done,
                target: self,
                action: #selector(didTappedSaveButton)
            )
            saveButton.tintColor = UIColor(named: "DPBlue")
            navigationItem.rightBarButtonItem = saveButton

            _view.exerciseTableView.delegate = self
            _view.exerciseTableView.dataSource = self
        }

        @objc private func didTappedSaveButton() {
            print(viewModel.workout)
            let cell = _view.exerciseTableView.visibleCells as! [Workout.Add.Exercise.View.Cell]
           
            for count in cell.indices {
                let currentCell = cell[count]

                let repandset = Data.Exercise.repAndWeight(
                        rep: Int(currentCell.repsTextField.text!)!,
                        weight: Double(currentCell.weightTextField.text!)!
                    )

                viewModel.workout.exercises[currentCell.tag].set!.append(repandset)

            }
            print("----------------")
            print(viewModel.workout)
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.workout.exercises[section].set!.count
        }

        func numberOfSections(in tableView: UITableView) -> Int {
            return viewModel.workout.exercises.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! Workout.Add.Exercise.View.Cell
            cell.setLabel.text = String(indexPath.row + 1)
            cell.tag = indexPath.section
            return cell
        }

        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 50
        }

        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let view = Workout.Add.Exercise.FooterView()
            view.addButton.tag = section
            view.addButton.addTarget(
                self,
                action: #selector(didTappedAddButton(_:)),
                for: .touchUpInside
            )
            return view

        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return viewModel.workout.exercises[section].name
        }

        @objc private func didTappedAddButton(_ sender: UIButton) {

            var exercise = viewModel.workout.exercises[sender.tag].set!

            let indexPath = IndexPath(row: exercise.count - 1, section: 0)
            let cell = _view.exerciseTableView.cellForRow(at: indexPath)
                as! Workout.Add.Exercise.View.Cell

            let addRow = IndexPath(row: exercise.count, section: sender.tag)
            let repandset = Data.Exercise.repAndWeight(
                rep: Int(cell.repsTextField.text!)!,
                weight: Double(cell.weightTextField.text!)!
            )

            viewModel.workout.exercises[sender.tag].set!.append(repandset)
            _view.exerciseTableView.insertRows(at: [addRow], with: .automatic)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    }
}
