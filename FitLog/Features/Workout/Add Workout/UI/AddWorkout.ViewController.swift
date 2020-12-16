//
//  AddWorkout.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 13/12/2020.
//

import UIKit

extension Workout.Add {

    class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {

        let viewModel = Workout.Add.ViewModel()

        private var _view: View!

        public override func loadView() {

            super.loadView()

            let view = View()
            self.view = view
            _view = view
        }

        override func viewDidLoad() {

            title = "Add workout"

            let saveButton = UIBarButtonItem(
                title: "Save",
                style: .done,
                target: self,
                action: #selector(didTappedSaveButton)
            )
            saveButton.tintColor = UIColor(named: "DPBlue")

            let cancelButton = UIBarButtonItem(
                title: "Cancel",
                style: .done,
                target: self,
                action: #selector(didTappedCancelButton)
            )
            cancelButton.tintColor = .red

            navigationItem.leftBarButtonItem = cancelButton
            navigationItem.rightBarButtonItem = saveButton

            _view.muscleGroupPicker.dataSource = self
            _view.muscleGroupPicker.delegate = self
            _view.exerciseTableView.dataSource = self
            _view.exerciseTableView.delegate = self
            _view.addButton.addTarget(self, action: #selector(didTappedAddButton), for: .touchUpInside)

        }

        @objc private func didTappedAddButton() {

            let exercise = _view.exerciseNameTextField.text
            _view.exerciseNameTextField.text?.removeAll()

            viewModel.exercises.append(exercise!)
            _view.exerciseTableView.reloadData()
        }

        @objc private func didTappedSaveButton() {

            let workout = Data.Workout(
                workoutName: _view.workoutNameTextField.text!,
                exercises: viewModel.exercises.map({
                    Data.Exercise(name: $0, setAndRep: [Data.Exercise.setAndRep(set: 1, rep: 12)], weight: 0)
                }),
                muscleGroup: .Abdominals)

            let exviewModel = Workout.Add.Exercise.ViewModel(workout: workout)
            navigationController?.pushViewController(Workout.Add.Exercise.ViewController(viewModel: exviewModel), animated: true)
        }

        @objc private func didTappedCancelButton() {

            dismiss(animated: true, completion: nil)
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.exercises.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let exercise = viewModel.exercises[indexPath.row]
            cell.textLabel?.text = exercise
            return cell
        }

        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return "You can add sets and reps on the next view."
        }

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return viewModel.pickerViewData.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return viewModel.pickerViewData[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            _view.muscleGroupTextField.text = viewModel.pickerViewData[row]
        }
    }
}
