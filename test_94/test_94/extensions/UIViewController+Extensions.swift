//
//  UIViewController+Extensions.swift
//  test_94
//
//  Created by Sam on 3/24/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let Cancel = UIAlertAction(title: "OK", style: .cancel) { _ in
            
        }
        alert.addAction(Cancel)
        self.present(alert, animated: true) { }
    }

}
