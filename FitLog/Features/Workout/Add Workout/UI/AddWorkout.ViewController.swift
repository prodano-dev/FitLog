//
//  AddWorkout.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 13/12/2020.
//

import UIKit

extension Workout.Add {

    class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


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

        }

        @objc private func didTappedSaveButton() {

        }

        @objc private func didTappedCancelButton() {

            dismiss(animated: true, completion: nil)
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
    }
}
