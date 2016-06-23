import UIKit

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.registerClass(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.Identifier)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let columns = CGFloat(4)
        let bounds = UIScreen.mainScreen().bounds
        let size = (bounds.width - columns) / columns
        layout.itemSize = CGSize(width: size, height: size)
        layout.headerReferenceSize = CGSizeMake(bounds.width, 22);
    }
}


extension CollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PhotoCell.Identifier, forIndexPath: indexPath) as! PhotoCell

//        if let url = NSURL(string: "https://unsplash.it/100/100/?random") {

        return cell
    }

}

extension UIImageView {
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .ScaleAspectFit) {
        guard let url = NSURL(string: link) else { return }
        contentMode = mode
        NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) in
            guard
            let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
            let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
            let data = data where error == nil,
            let image = UIImage(data: data)
            else { return }
            dispatch_async(dispatch_get_main_queue(), {
                self.image = image
            })
        }.resume()
    }
}
