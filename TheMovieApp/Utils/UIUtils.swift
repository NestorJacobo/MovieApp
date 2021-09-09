
import UIKit

class UIUtils{
    static func changeRootView(window: UIWindow, storyboard: String, view: String) {
       
            let mainStoryboard = UIStoryboard(name: storyboard, bundle: nil)
            let vc = mainStoryboard.instantiateViewController(
                withIdentifier: view)
            
            // Prepare main navigation controller
            let navController = UINavigationController(rootViewController: vc)
            setupNavigationBar(navController.navigationBar)
            
            window.rootViewController = navController
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve

        // The duration of the transition animation, measured in seconds.
        let duration: TimeInterval = 0.4

        // Creates a transition animation.
        // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            // maybe do something on completion here
        })
    }
    
    static func setupNavigationBar(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
