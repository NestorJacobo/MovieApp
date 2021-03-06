
import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupRealm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let vc = UIStoryboard(
            name: "Main",
            bundle: nil).instantiateViewController(
                withIdentifier: "MainViewController") as! MainViewController
        
        let nav = UINavigationController(rootViewController: vc)
//        setupNavigation(navigationBar: nav.navigationBar)
        
        window = UIWindow()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setupRealm() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema versionbefore, the version is 0).
            schemaVersion: 1,

            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }
    
}

