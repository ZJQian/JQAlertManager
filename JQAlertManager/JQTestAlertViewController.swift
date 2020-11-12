//
//  JQTestAlertViewController.swift
//  JQAlertManager
//
//  Created by HyBoard on 2020/11/12.
//

import UIKit

class JQTestAlertViewController: JQBaseAlertViewController {

    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bgView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.addSubview(bgView)
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
        btn.setTitle("close", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        bgView.addSubview(btn)
        
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func alertViewSize() -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}
