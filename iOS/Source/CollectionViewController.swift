import UIKit

class CollectionViewController: BaseCollectionViewController {
    override func loadView() {
        let view = RootView(frame: UIScreen.mainScreen().bounds)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
