//
//  ViewController.swift
//  JQAlertManager
//
//  Created by HyBoard on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {

    lazy var testTableView: UITableView = {
        let table = UITableView(frame: view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    var dataList = ["center scale",
                    "from top",
                    "bottom sheet",
                    "navi push"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "AlertDemo"
        view.backgroundColor = UIColor.white
        view.addSubview(testTableView)
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let str = dataList[indexPath.row]
        switch str {
        case "center scale":
            let vc = JQTestAlertViewController()
            self.show(vc, animation: JQCenterScaleAnimation(), shouldDismissOnTouchOutside: true, completion: nil)
            
        case "from top":
            let vc = JQTestAlertViewController()
            self.show(vc, animation: JQCenterFromTopAnimation(), shouldDismissOnTouchOutside: false, completion: nil)
            
        case "bottom sheet":
            let vc = JQBottomSheetViewController()
            self.show(vc, animation: JQBottomAnimation(), shouldDismissOnTouchOutside: true, completion: nil)
            
        case "navi push":
            let vc = JQWithNaviPushViewController()
            let nav = UINavigationController(rootViewController: vc)
            self.show(nav, animation: JQCenterScaleAnimation(), completion: nil)
        default:
            break
        }
    }
}
