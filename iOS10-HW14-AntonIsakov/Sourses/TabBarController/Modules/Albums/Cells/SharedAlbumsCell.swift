
import UIKit

class SharedAlbumsCell: UICollectionViewCell {
    
    static let identifier = "SharedAlbums"
    
    // MARK: - Outlets
    
    private lazy var numberOfPhotos: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var featuredTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(numberOfPhotos)
        contentView.addSubview(featuredTitle)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            image.trailingAnchor.constraint (equalTo: contentView.trailingAnchor, constant: -2),
            image.heightAnchor.constraint (equalTo: image .widthAnchor) ,
            
            featuredTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 2),
            featuredTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            featuredTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            
            numberOfPhotos.topAnchor.constraint(equalTo: featuredTitle.bottomAnchor, constant: 2), 
            numberOfPhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            numberOfPhotos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            numberOfPhotos.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: EntitylItem) {
        featuredTitle.text = model.description
        numberOfPhotos.text = String("\(model.numberOfPhotos ?? 0)")
        image.image = model.image
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        featuredTitle.text = ""
    }
    
}
