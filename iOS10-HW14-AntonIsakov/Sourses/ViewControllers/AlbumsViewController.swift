import UIKit

class AlbumsViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(SharedAlbumsCell.self, forCellWithReuseIdentifier: SharedAlbumsCell.identifier)
        collectionView.register(MediaCell.self, forCellWithReuseIdentifier: MediaCell.identifier)
        collectionView.register(UtilitiesCell.self, forCellWithReuseIdentifier: UtilitiesCell.identifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        collectionView.register(HeaderWithButtonAll.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderWithButtonAll.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = "Альбомы"
        view.backgroundColor = .white
        let plusButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(plusButtonTapped))
        plusButton.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: .regular)],
            for: .normal
        )
        navigationItem.leftBarButtonItem = plusButton
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - CollectionViewLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            
            switch section {
                
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.5))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 10,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.47),
                                                       heightDimension: .fractionalWidth(1 / 1.7 * 2))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 10,
                                                                    bottom: 0,
                                                                    trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 10,
                                                                      bottom: 0,
                                                                      trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(0.93),
                                                                     heightDimension: .estimated (40))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.interGroupSpacing = 5
                
                return layoutSection
                
            case 1:
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 10,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .fractionalWidth(0.57)
                )
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 10,
                                                                    bottom: 0,
                                                                    trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 10,
                                                                      bottom: 0,
                                                                      trailing: 10)
                
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(0.93),
                                                                     heightDimension: .estimated (40))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 0,
                                                                   bottom: 5,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(44))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 10,
                                                                    bottom: 0,
                                                                    trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 10,
                                                                      trailing: 10)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(0.88),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
        }
    }
}

// MARK: - Collection Setup

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let currentSection = ModelSection.modelSectionArray[section]
        let itemCount = currentSection.items.count
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as? MyAlbumsCell
            let section = ModelSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: SharedAlbumsCell.identifier, for: indexPath) as? SharedAlbumsCell
            let section = ModelSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        case 2:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCell.identifier, for: indexPath) as? MediaCell
            let section = ModelSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesCell.identifier, for: indexPath) as? UtilitiesCell
            let section = ModelSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderWithButtonAll.identifier, for: indexPath) as? HeaderWithButtonAll
            let section = ModelSection.modelSectionArray[indexPath.section]
            header?.configuration(model: section)
            
            return header ?? UICollectionReusableView()
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as? Header
            let section = ModelSection.modelSectionArray[indexPath.section]
            header?.configuration(model: section)
            
            return header ?? UICollectionReusableView()
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as? Header
            let section = ModelSection.modelSectionArray[indexPath.section]
            header?.configuration(model: section)
            
            return header ?? UICollectionReusableView()
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as? Header
            let section = ModelSection.modelSectionArray[indexPath.section]
            header?.configuration(model: section)
            
            return header ?? UICollectionReusableView()
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ModelSection.modelSectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    @objc private func plusButtonTapped() {}
}


