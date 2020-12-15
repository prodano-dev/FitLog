//
//  AddExercise.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 15/12/2020.
//

import UIKit

extension Workout.Add.Exercise {

    class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        private var _view: View!

        public override func loadView() {

           super.loadView()

           let view = View()
           self.view = view
           _view = view
        }

        public var setAmount = 1

        override func viewDidLoad() {

            _view.exerciseTableView.delegate = self
            _view.exerciseTableView.dataSource = self
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return setAmount
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! Workout.Add.Exercise.View.Cell

            return cell
        }

        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 50
        }

        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            print(section)
            let view = Workout.Add.Exercise.FooterView()
            view.addButton.addTarget(self, action: #selector(didTappedAddButton), for: .touchUpInside)
            return view

        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Benchpress/"
        }

        @objc private func didTappedAddButton() {
            let addRow = IndexPath(row: setAmount, section: 0)
            setAmount += 1
            _view.exerciseTableView.insertRows(at: [addRow], with: .automatic)
        }

    }


}
