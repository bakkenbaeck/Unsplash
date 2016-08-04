import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?

    private lazy var fetcher: Fetcher = {
        let fetcher = Fetcher(baseURL: "https://unsplash.it", modelName: "DataModel")

        return fetcher
    }()
}

extension AppDelegate: UIApplicationDelegate {
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        guard let window = self.window else { fatalError("Window not found") }

        window.rootViewController = RootController(fetcher: self.fetcher, collectionViewLayout: UICollectionViewFlowLayout())
        window.makeKeyAndVisible()

        return true
    }
}
