//
//  AppCoordinator.swift
//  CoordinatoPattern
//
//  Created by Md. Kamrul Hasan on 24/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var window: UIWindow?
    var navController: UINavigationController?
    var viewController: UIViewController?
    
    var authCoordinator: AuthCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        viewController = ViewController.getViewController()
        navController = UINavigationController(rootViewController: viewController!)
        
//        window?.rootViewController = navController
//        window?.makeKeyAndVisible()
        
        if !UserDefaults.standard.bool(forKey: "Is_Logged_In") {
            loadAuth()
        } else {
            loadHome()
        }
        
    }
    
    func loadAuth() {
        authCoordinator = AuthCoordinator(window: window)
        authCoordinator?.authenticationDoneAction = { [weak self] in
            UserDefaults.standard.setValue(true, forKey: "Is_Logged_In")
            self?.loadHome()
        }
        authCoordinator?.start()
    }
    
    func loadHome() {
        homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator?.start()
    }
}
