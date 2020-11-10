//
//  ViewController.swift
//  ASDarkModeKit
//
//  Created by amitpstu1@gmail.com on 11/10/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASDarkModeKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.dynamicColor(dark: .black, light: .cyan)
        userName.textColor = UIColor.dynamicColor(dark: .cyan, light: .black)
        profileImageView.image = UIImage.dynamicImage(dark: UIImage(named: "light")!, light: UIImage(named: "dark")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

