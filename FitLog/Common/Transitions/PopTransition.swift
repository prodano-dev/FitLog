//
//  PopTransition.swift
//  FitLog
//
//  Created by Danny Prodanovic on 13/01/2021.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 0.95
    var presenting = true
    var originFrame = CGRect.zero

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        let containerView = transitionContext.containerView

        toView?.alpha = 0

        [fromView, toView]
            .compactMap { $0 }
            .forEach { containerView.addSubview($0)}

        let duration = self.transitionDuration(using: transitionContext)
        let spring: CGFloat = 0.95
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: spring) {
            toView?.alpha = 1
        }

        animator.startAnimation()
    }


}
