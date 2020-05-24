//
//  ViewController.swift
//  CoordinatoPattern
//
//  Created by Md. Kamrul Hasan on 24/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    class func getViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return viewController
    }

}

