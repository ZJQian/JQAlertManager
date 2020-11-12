//
//  UIViewController+Alert.swift
//  AlertTest
//
//  Created by HyBoard on 2020/8/20.
//  Copyright © 2020 HyBoard. All rights reserved.
//

import UIKit

extension UIViewController {
    func show(_ viewControllerToPresent: UIViewController, animation: JQBaseAnimation = JQCenterScaleAnimation(), shouldDismissOnTouchOutside: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let vc = JQAlertPresentationController(presentedViewController: viewControllerToPresent, presenting: self)
            viewControllerToPresent.transitioningDelegate = vc
            vc.animation = animation
            vc.bgViewUserInteractionEnabled = shouldDismissOnTouchOutside
            self.present(viewControllerToPresent, animated: true, completion: completion)
        }
    }
}
