import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let HeaderSize = CGFloat(60)
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject:AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        let numberOfColumns = CGFloat(4)
        let layout = UICollectionViewFlowLayout()
        let bounds = UIScreen.mainScreen().bounds
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let size = (bounds.width - numberOfColumns) / numberOfColumns
        layout.itemSize = CGSize(width: size, height: size)
        layout.sectionInset = UIEdgeInsets(top: AppDelegate.HeaderSize, left: 0, bottom: 10, right: 0)

        let collectionViewController = CollectionViewController(collectionViewLayout: layout)
        collectionViewController.title = "Remote"

        self.window?.rootViewController = collectionViewController
        self.window!.makeKeyAndVisible()

        return true
    }
}
