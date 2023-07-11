import UIKit

struct CompositionalItem: Hashable {
    var description: String?
    var image: UIImage?
    var numberOfPhotos: Int?
    
}

struct CompositionalSection: Hashable {
    var name: String
    var items: [CompositionalItem]
}

extension CompositionalSection {
    
    static var modelSectionArray = [
        CompositionalSection(name: "Мои альбомы",
                             items: [CompositionalItem(description: "Недавние", image: UIImage(named: "BMW") ?? UIImage() , numberOfPhotos: 6),
                                     CompositionalItem(description: "Избранное", image: UIImage(named: "tiger") ?? UIImage(), numberOfPhotos: 226),
                                     CompositionalItem(description: "WhatsApp", image: UIImage(named: "WhiteBear") ?? UIImage(), numberOfPhotos: 436),
                                     CompositionalItem(description: "Instagram", image: UIImage(named: "moto") ?? UIImage(), numberOfPhotos: 116),
                                     CompositionalItem(description: "Viber", image: UIImage(named: "Sea") ?? UIImage(), numberOfPhotos: 73),
                                     CompositionalItem(description: "Another", image: UIImage(named: "dog") ?? UIImage(), numberOfPhotos: 56)]),
        
        CompositionalSection(name: "Люди и места",
                             items: [CompositionalItem(description: "Люди", image: UIImage(named: "moto") ?? UIImage(), numberOfPhotos: 123),
                                     CompositionalItem(description: "Места", image: UIImage(named: "dog") ?? UIImage(), numberOfPhotos: 123)]),
        
        CompositionalSection(name: "Типы медиафайлов",
                             items: [CompositionalItem(description: "Видео", image: UIImage(systemName: "video") ?? UIImage(), numberOfPhotos: 123),
                                     CompositionalItem(description: "Селфи", image: UIImage(systemName: "person.crop.square") ?? UIImage(), numberOfPhotos: 76),
                                     CompositionalItem(description: "Фото Live Photos", image: UIImage(systemName: "livephoto") ?? UIImage(), numberOfPhotos: 653),
                                     CompositionalItem(description: "Портреты", image: UIImage(systemName: "cube") ?? UIImage(), numberOfPhotos: 18),
                                     CompositionalItem(description: "Панорамы", image: UIImage(systemName: "pano") ?? UIImage(), numberOfPhotos: 53),
                                     CompositionalItem(description: "Замедленно", image: UIImage(systemName: "livephoto") ?? UIImage(), numberOfPhotos: 93),
                                     CompositionalItem(description: "Серии", image: UIImage(systemName: "square.3.layers.3d.down.right") ?? UIImage(), numberOfPhotos: 54),
                                     CompositionalItem(description: "Снимки экрана", image: UIImage(systemName: "camera.viewfinder") ?? UIImage(), numberOfPhotos: 24),
                                     CompositionalItem(description: "Анимирование", image: UIImage(systemName: "square.stack.3d.forward.dottedline") ?? UIImage(), numberOfPhotos: 15)]),
        
        CompositionalSection(name: "Другое",
                             items: [CompositionalItem(description: "Имрортированные", image: UIImage(systemName: "square.and.arrow.down") ?? UIImage(), numberOfPhotos: 123),
                                     CompositionalItem(description: "Дубликаты", image: UIImage(systemName: "square.on.square") ?? UIImage(), numberOfPhotos: 123),
                                     CompositionalItem(description: "Скрытые", image: UIImage(systemName: "eye.slash") ?? UIImage(), numberOfPhotos: 123),
                                     CompositionalItem(description: "Недавно удаленные", image: UIImage(systemName: "trash") ?? UIImage(), numberOfPhotos: 9)])
    ]
}
