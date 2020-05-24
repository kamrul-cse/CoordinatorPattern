//
//  LoginVC.swift
//  CoordinatoPattern
//
//  Created by Md. Kamrul Hasan on 24/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var signUpAction: ( () -> Void )?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    class func getVC() -> LoginVC {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        return vc
    }

    @IBAction func signUpTapped(_ sender: Any) {
        signUpAction?()
    }
}
