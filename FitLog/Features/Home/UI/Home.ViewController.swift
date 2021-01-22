//
//  Home.ViewController.swift
//  FitLog
//
//  Created by Danny Prodanovic on 12/12/2020.
//

import UIKit

extension Home {

    class ViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout,
                          UIViewControllerTransitioningDelegate {

        let viewModel = Home.ViewModel()

        private var _view: View!

        public override func loadView() {

            super.loadView()

            let view = View()
            self.view = view
            _view = view
        }

        override func viewDidLoad() {

            let add = UIBarButtonItem(
                image: UIImage(systemName: "plus"),
                style: .plain,
                target: self,
                action: #selector(didTappedPlusButton)
            )
            navigationItem.rightBarButtonItem = add
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 34)!
            ]
            title = "WORKOUTS"

            _view.workoutCollection.delegate = self
            _view.workoutCollection.dataSource = self
        }

        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)
            let cells = _view.workoutCollection.visibleCells as! [Home.View.Cell]

            switch traitCollection.userInterfaceStyle {
            case .dark:

                cells.forEach({
                    $0.layer.shadowColor = UIColor(named: "DPBlue")?.cgColor
                })
            case .light:

                cells.forEach({
                    $0.layer.shadowColor = UIColor.black.cgColor
                })
            default:

                cells.forEach({
                    $0.layer.shadowColor = UIColor.black.cgColor
                })
            }
        }

        @objc private func didTappedPlusButton() {

            present(UINavigationController(rootViewController: Workout.Add.ViewController()), animated: true)

        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = view.frame.size.height
            let width = view.frame.size.width

            return CGSize(width: width * 0.9, height: height * 0.3)
        }


        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.celldata.count

        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Home.View.Cell
            let data = viewModel.celldata[indexPath.row]
            cell.startButton.tag = indexPath.row
            cell.startButton.addTarget(self, action: #selector(didTappedStart(_:)), for: .touchUpInside)
            cell.muscleGroupLabel.text = "Muscle group: \(data.group)"
            cell.workoutNameLabel.text = data.workoutname
            cell.totalExcersissesLabel.text = "Total exercises: \(data.amount)"
            cell.backgroundImage.image = UIImage(named: "\(data.image)")
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = Workout.Edit.ViewController()
            present(vc, animated: true)

//            navigationController?.pushViewController(vc, animated: true)
        }

        @objc private func didTappedStart(_ sender: UIButton) {
            print(sender.tag)
        }

        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            let transition = PopAnimator()
            return transition
        }


    }
}
