//
//  Home.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Home {

    class ViewController: UIViewController {

        private var _view: View!

        public override func loadView() {

            super.loadView()

            let view = View()
            self.view = view
            _view = view
        }

        override func viewDidLoad() {
            navigationController?.navigationBar.prefersLargeTitles = true
            title = "WORKOUTS"
        }
    }
}
