import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let Identifier = "PhotoCellIdentifier"
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .ScaleAspectFill
        
        return view
    }()

}
