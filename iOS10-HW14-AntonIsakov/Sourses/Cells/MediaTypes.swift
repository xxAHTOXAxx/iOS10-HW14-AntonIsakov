import UIKit

class MediaTypes: UICollectionViewCell {
    
    static let identifier = "MediaTypes"
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var additionalTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray2.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(additionalTextLabel)
        contentView.addSubview(divider)
        
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            additionalTextLabel.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: -25),
            additionalTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            divider.leadingAnchor.constraint (equalTo: iconImageView.trailingAnchor),
            divider.trailingAnchor.constraint (equalTo: arrowImageView.trailingAnchor),
            divider.bottomAnchor.constraint (equalTo: bottomAnchor),
            divider.heightAnchor.constraint (equalToConstant: 1)
        ])
    }
    
    func configuration(model: CompositionalItem) {
        self.titleLabel.text = model.description
        self.additionalTextLabel.text = String("\(model.numberOfPhotos ?? 0)")
        self.iconImageView.image = model.image
    }
    
}
