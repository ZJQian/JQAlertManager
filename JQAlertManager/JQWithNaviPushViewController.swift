//
//  JQWithNaviPushViewController.swift
//  JQAlertManager
//
//  Created by HyBoard on 2020/11/12.
//

import UIKit

class JQWithNaviPushViewController: JQBaseAlertViewController {

    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.delegate = self
        let size = UIScreen.main.bounds.size
        bgView.frame = CGRect(x: (size.width-300)/2, y: (size.height-300)/2, width: 300, height: 300)
        view.addSubview(bgView)
        
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
        btn.setTitle("close", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        bgView.addSubview(btn)
        
        let btn2 = UIButton(type: .custom)
        btn2.frame = CGRect(x: 30, y: btn.frame.maxY+20, width: 100, height: 50)
        btn2.setTitle("go Next", for: .normal)
        btn2.setTitleColor(UIColor.white, for: .normal)
        btn2.backgroundColor = UIColor.orange
        btn2.addTarget(self, action: #selector(goNextAction), for: .touchUpInside)
        bgView.addSubview(btn2)
    }
    
    override func alertViewSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goNextAction() {
        
        guard let nav = navigationController else {
            print("需要添加导航器")
            return
        }
        let vc = TestViewController()
        nav.pushViewController(vc, animated: true)
    }
}


extension JQWithNaviPushViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let isShow = viewController.isKind(of: JQWithNaviPushViewController.self)
        navigationController.setNavigationBarHidden(isShow, animated: true)
    }
}
