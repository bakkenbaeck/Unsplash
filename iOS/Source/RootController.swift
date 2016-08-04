import UIKit
import DATASource
import CoreData

class RootController: BaseCollectionViewController {
    lazy var dataSource: DATASource = {
        let request = NSFetchRequest(entityName: Photo.entityName())
        request.sortDescriptors = [
                NSSortDescriptor(key: PhotoAttributes.filename.rawValue, ascending: true)
        ]

        let dataSource = DATASource(collectionView: self.collectionView!, cellIdentifier: PhotoCell.Identifier, fetchRequest: request, mainContext: self.fetcher.viewContext) { cell, item, indexPath in
            if let cell = cell as? PhotoCell, photo = item as? Photo {
                cell.photo = photo
            }
        }

        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Photos"
        self.collectionView?.registerClass(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.Identifier)
        self.collectionView?.dataSource = self.dataSource

        self.fetcher.photos { error in

        }
    }
}