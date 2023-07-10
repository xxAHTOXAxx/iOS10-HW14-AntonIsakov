import UIKit

class MyAlbums: UICollectionViewCell {
    
    static let identifier = "MyAlbums"
    
    // MARK: - Outlets
    
    private lazy var numberOfPhotos: UILabel = {
        let label = UILabel()
        //label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var featuredTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
       //label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
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
                        image.widthAnchor.constraint(equalTo: image.heightAnchor), // Set the width equal to the height
                        image.heightAnchor.constraint(equalToConstant: 150), // Adjust the image height as desired

                        featuredTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8), // Adjust the spacing between the title and the image
                        featuredTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
                        featuredTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),

                        numberOfPhotos.topAnchor.constraint(equalTo: featuredTitle.bottomAnchor, constant: 4), // Adjust the spacing between the title and the number of photos
                        numberOfPhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
                        numberOfPhotos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
                        numberOfPhotos.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
               ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: CompositionalItem) {
        self.featuredTitle.text = model.description
        self.numberOfPhotos.text = String("\(model.numberOfPhotos ?? 0)")
        self.image.image = model.image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
