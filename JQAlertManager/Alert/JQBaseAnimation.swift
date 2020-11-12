//
//  JQBaseAnimation.swift
//  AlertTest
//
//  Created by HyBoard on 2020/8/20.
//  Copyright © 2020 HyBoard. All rights reserved.
//

import UIKit

class JQBaseAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    var presentingViewController: UIViewController?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return transitionContext!.isAnimated ? 0.35 : 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }

}
