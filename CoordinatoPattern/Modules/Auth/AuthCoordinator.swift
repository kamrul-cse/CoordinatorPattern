//
//  AuthCoordinator.swift
//  CoordinatoPattern
//
//  Created by Md. Kamrul Hasan on 24/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

class AuthCoordinator {
    var window: UIWindow?
    
    var authenticationDoneAction: ( () -> Void )?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = getDesiredVC()
        window?.makeKeyAndVisible()
    }
    
    func getDesiredVC() -> UIViewController {
        if !UserDefaults.standard.bool(forKey: "New_User") {
            let vc = LoginVC.getVC()
            vc.signUpAction = { [weak self] in
                self?.loadSignup()
            }
            return vc
        } else {
            return SignupVC.getVC()
        }
    }
    
    func loadSignup() {
        let vc = SignupVC.getVC()
        vc.signupDoneAction = { [weak self] in
            self?.authenticationDoneAction?()
        }
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
}
