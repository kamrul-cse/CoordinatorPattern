//
//  SignupVC.swift
//  CoordinatoPattern
//
//  Created by Md. Kamrul Hasan on 24/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    var signupDoneAction: ( () -> Void )?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    class func getVC() -> SignupVC {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        return vc
    }
    @IBAction func signupDoneTapped(_ sender: Any) {
        signupDoneAction?()
    }
    
}
