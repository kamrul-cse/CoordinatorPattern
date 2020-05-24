//
//  HomeCoordinator.swift
//  CoordinatoPattern
//
//  Created by Md. Kamrul Hasan on 24/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

class HomeCoordinator {
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = HomeVC.getVC()
        window?.makeKeyAndVisible()
    }
}
