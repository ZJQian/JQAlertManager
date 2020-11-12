//
//  JQBottomSheetViewController.swift
//  JQAlertManager
//
//  Created by HyBoard on 2020/11/12.
//

import UIKit

class JQBottomSheetViewController: JQBaseAlertViewController {

    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bgView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        view.addSubview(bgView)
    }
    
    override func alertViewSize() -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 300)
    }
}
