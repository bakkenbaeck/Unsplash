import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let Identifier = "PhotoCellIdentifier"
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .ScaleAspectFill
        view.backgroundColor = UIColor.redColor()
        
        return view
    }()

    func setImage(image : UIImage){
        self.imageView.image = image
    }
}
