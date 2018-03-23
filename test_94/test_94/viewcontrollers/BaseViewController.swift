//
//  BaseViewController.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var hudView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK - Helper
    func showHUD() {
        if(hudView == nil){
            hudView = UIView(frame: self.view.bounds)
            hudView.backgroundColor = UIColor.black
            hudView.alpha = 0.8
        }
        self.view.addSubview(hudView)
    }
    
    func dismissHUD() {
        if(hudView != nil){
            hudView.removeFromSuperview()
        }
    }
}
