import UIKit

class CompositionalLayoutViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(MyAlbums.self, forCellWithReuseIdentifier: MyAlbums.identifier)
        collectionView.register(SharedAlbums.self, forCellWithReuseIdentifier: SharedAlbums.identifier)
        collectionView.register(MediaTypes.self, forCellWithReuseIdentifier: MediaTypes.identifier)
        collectionView.register(Utilities.self, forCellWithReuseIdentifier: Utilities.identifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
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
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 10,
                                                                      bottom: 0,
                                                                      trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(0.93),
                                                                     heightDimension: .estimated (80))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
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
                                                                     heightDimension: .estimated (80))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
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
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 0,
                                                                      bottom: 10,
                                                                      trailing: 10)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(0.88),
                                                                     heightDimension: .estimated(80))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
        }
    }
}

// MARK: - Collection Setup

extension CompositionalLayoutViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let currentSection = CompositionalSection.modelSectionArray[section]
        let itemCount = currentSection.items.count
        return itemCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbums.identifier, for: indexPath) as? MyAlbums
            let section = CompositionalSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: SharedAlbums.identifier, for: indexPath) as? SharedAlbums
            let section = CompositionalSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
         
            return item ?? UICollectionViewCell()
        case 2:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypes.identifier, for: indexPath) as? MediaTypes
            let section = CompositionalSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: Utilities.identifier, for: indexPath) as? Utilities
            let section = CompositionalSection.modelSectionArray[indexPath.section]
            let model = section.items[indexPath.item]
            item?.configuration(model: model)
            
            return item ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            let section = CompositionalSection.modelSectionArray[indexPath.section]
                header.configuration(model: section)
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            let section = CompositionalSection.modelSectionArray[indexPath.section]
                header.configuration(model: section)
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            let section = CompositionalSection.modelSectionArray[indexPath.section]
                header.configuration(model: section)
            return header
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CompositionalSection.modelSectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}


