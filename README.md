# Coordinator Pattern | The Managerial Approach in iOS App Architecture

What is Coordinator Pattern, Benefits and Applications.

<a href="https://youtu.be/8BcxIJ1Ms3E">
<img src="https://github.com/kamrul-cse/CoordinatorPattern/blob/master/Screenshots/banner.png" width="100%" > 
</a>

Here we are going to learn
 + About Coordinator Pattern
 + What went wrong with the current process
 + How to manage Coordinator Pattern

Manage own navigation flow with Coordinator Pattern.

See step by step in-

<a href="https://youtu.be/8BcxIJ1Ms3E">
<img src="https://www.edmtunes.com/wp-content/uploads/2018/01/nc-logo-youtube-mobile.jpg" width="80px" >
</a>

 + <a href="https://youtu.be/0Q4VxMX_ZCE">Part-I: Introduction to Coordinator Pattern</a>
 + <a href="https://youtu.be/oA-gJCWL3yo">Part-II: Introducing AppCoordinator</a>
 + <a href="https://youtu.be/q2t7_Hheyuc">Part-III: Manage Child Coordinators</a>

Result:

<a href="https://youtu.be/8BcxIJ1Ms3E">
<img src="https://github.com/kamrul-cse/CoordinatorPattern/blob/master/Screenshots/output_1.png" width="33%" >
<img src="https://github.com/kamrul-cse/CoordinatorPattern/blob/master/Screenshots/output_2.png" width="33%" >
<img src="https://github.com/kamrul-cse/CoordinatorPattern/blob/master/Screenshots/output_3.png" width="33%" >
</a>

Here is my `SceneDelegate` file:

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoorinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        appCoorinator = AppCoordinator(window: window)
        appCoorinator?.start()
        
    }
    
    //...
    //other methods
    //goes here
    
}
```

Here is my `AppCoordinator`:

```swift
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
```


## Author
Md. Kamrul Hasan, mhgolap11@gmail.com

© MKHG Lab, mkhglab@gmail.com
