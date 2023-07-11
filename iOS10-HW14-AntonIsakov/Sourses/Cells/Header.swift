import UIKit

class Header: UICollectionReusableView {
    
    static let identifier = "Header"
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
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
        addSubview(title)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
    
    func configuration(model: CompositionalSection) {
        self.title.text = model.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}

