import UIKit

class Header: UICollectionReusableView {
    
    static let identifier = "Header"
    
    // MARK: - Outlets
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(title)
        addSubview(divider)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.leftAnchor.constraint(equalTo: leftAnchor),
            
            divider.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -8),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configuration(model: ModelSection) {
        self.title.text = model.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    
    @objc private func allButtonTapped() {}
}

