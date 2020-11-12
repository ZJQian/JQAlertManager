//
//  JQCenterScaleAnimation.swift
//  AlertTest
//
//  Created by HyBoard on 2020/8/21.
//  Copyright © 2020 HyBoard. All rights reserved.
//

import UIKit

class JQCenterScaleAnimation: JQBaseAnimation {

    private let duration = 0.3
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from)
        
        let isPresenting = (fromVC == self.presentingViewController)
        
        
        if isPresenting {
            
            var alertVC: JQBaseAlertViewController!
            let toVC = transitionContext.viewController(forKey: .to)
            if toVC is UINavigationController {
                let nav = toVC as! UINavigationController
                alertVC = nav.topViewController as? JQBaseAlertViewController
            }else {
                alertVC = toVC as? JQBaseAlertViewController
            }
            let toView = transitionContext.view(forKey: .to)
            let toViewSize = alertVC.alertViewSize()
            
            let containerView = transitionContext.containerView
            toView?.bounds = CGRect(x: 0, y: 0, width: toViewSize.width, height: toViewSize.height)
            toView?.center = CGPoint(x: UIScreen.main.bounds.size.width/2.0, y: UIScreen.main.bounds.size.height/2.0)
            containerView.addSubview(toView!)
            
            toView?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .curveEaseInOut, animations: {
                toView?.transform = .identity
            }) { (finish) in
                transitionContext.completeTransition(finish)
            }
            
        }else {
            
            
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                fromView?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                fromView?.alpha = 0
            }) { (finished) in
                fromView?.transform = .identity
                fromView?.alpha = 1.0
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
        
    }
}
