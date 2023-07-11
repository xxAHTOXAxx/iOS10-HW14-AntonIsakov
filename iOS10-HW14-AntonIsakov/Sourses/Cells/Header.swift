import UIKit

class Header: UICollectionReusableView {
    
    static let identifier = "Header"
    
    // MARK: - Outlets
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var allButton: UIButton = {
        let button = UIButton()
        button.setTitle("Все", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(allButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isAllButtonHidden: Bool = false {
        didSet {
            allButton.isHidden = isAllButtonHidden
        }
    }
    
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
        addSubview(allButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            allButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            allButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -1),
        ])
    }
    
    func configuration(model: CompositionalSection) {
        self.title.text = model.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    
    @objc private func allButtonTapped() {}
}

