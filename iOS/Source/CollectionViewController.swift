import UIKit

class CollectionViewController: UICollectionViewController {
    override func loadView() {
        let view = RootView(frame: UIScreen.mainScreen().bounds)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension CollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: PhotoCell.identifier, cellForItemAtIndexPath indexPath: NSIndexPath) -> PhotoCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(UICollectionViewCell.reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell

        let imageView = UIImageView()
        imageView.downloadedFrom(link: "https://unsplash.it/100/100/?random")

        cell.addSubview(imageView)

        return cell
    }

}

extension UIImageView {
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        contentMode = mode
        URLSession.shared().dataTask(with: url) { (data, response, error) in
            guard
            let httpURLResponse = response as? HTTPURLResponse where httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType where mimeType.hasPrefix("image"),
            let data = data where error == nil,
            let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.sync() { () -> Void in
                self.image = image
            }
        }.resume()
    }
}
