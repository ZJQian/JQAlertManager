//
//  JQCenterFromTopAnimation.swift
//  WXZGame
//
//  Created by HyBoard on 2020/8/25.
//  Copyright © 2020 HyBoard. All rights reserved.
//

import UIKit

class JQCenterFromTopAnimation: JQBaseAnimation {

    private let duration = 0.55
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
            let x = (UIScreen.main.bounds.size.width-toViewSize.width)/2.0
            let y = -1*UIScreen.main.bounds.size.height
            let beginFrame = CGRect(x: x, y: y, width: toViewSize.width, height: toViewSize.height)
            let showFrame = CGRect(x: x, y: (UIScreen.main.bounds.size.height-toViewSize.height)/2.0, width: toViewSize.width, height: toViewSize.height)
            
            let containerView = transitionContext.containerView
            toView?.frame = beginFrame
            containerView.addSubview(toView!)
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                toView?.frame = showFrame
            }) { (finish) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            
        }else {
            
            let fromView = transitionContext.view(forKey: .from)
            var alertVC: JQBaseAlertViewController!
            if fromVC is UINavigationController {
                let nav = fromVC as! UINavigationController
                alertVC = nav.topViewController as? JQBaseAlertViewController
            }else {
                alertVC = fromVC as? JQBaseAlertViewController
            }
            
            let toViewSize = alertVC.alertViewSize()
            let x = (UIScreen.main.bounds.size.width-toViewSize.width)/2.0
            let y = UIScreen.main.bounds.size.height
            let endFrame = CGRect(x: x, y: y, width: toViewSize.width, height: toViewSize.height)
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                
                fromView?.frame = endFrame
            }) { (finish) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
        
    }
}
