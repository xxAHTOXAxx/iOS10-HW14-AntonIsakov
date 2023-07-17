import UIKit

struct EntitylItem: Hashable {
    var description: String?
    var image: UIImage?
    var numberOfPhotos: Int?
}

struct ModelSection: Hashable {
    var name: String
    var items: [EntitylItem]
}

extension ModelSection {
    
    static var modelSectionArray = [
        ModelSection(
            name: "Мои альбомы",
            items: [
                EntitylItem(description: "Недавние", image: UIImage(named: "BMW") ?? UIImage() , numberOfPhotos: 6),
                EntitylItem(description: "Избранное", image: UIImage(named: "tiger") ?? UIImage(), numberOfPhotos: 226),
                EntitylItem(description: "WhatsApp", image: UIImage(named: "WhiteBear") ?? UIImage(), numberOfPhotos: 436),
                EntitylItem(description: "Instagram", image: UIImage(named: "moto") ?? UIImage(), numberOfPhotos: 116),
                EntitylItem(description: "Viber", image: UIImage(named: "Sea") ?? UIImage(), numberOfPhotos: 73),
                EntitylItem(description: "Another", image: UIImage(named: "dog") ?? UIImage(), numberOfPhotos: 56),
                EntitylItem(description: "Facebook", image: UIImage(named: "dog2") ?? UIImage(), numberOfPhotos: 54),
                EntitylItem(description: "My photo", image: UIImage(named: "bob") ?? UIImage(), numberOfPhotos: 21)
            ]
        ),
        
        ModelSection(
            name: "Люди и места",
            items: [
                EntitylItem(description: "Люди", image: UIImage(named: "moto") ?? UIImage(), numberOfPhotos: 123),
                EntitylItem(description: "Места", image: UIImage(named: "dog") ?? UIImage(), numberOfPhotos: 123)
            ]
        ),
        
        ModelSection(
            name: "Типы медиафайлов",
            items: [
                EntitylItem(description: "Видео", image: UIImage(systemName: "video") ?? UIImage(), numberOfPhotos: 123),
                EntitylItem(description: "Селфи", image: UIImage(systemName: "person.crop.square") ?? UIImage(), numberOfPhotos: 76),
                EntitylItem(description: "Фото Live Photos", image: UIImage(systemName: "livephoto") ?? UIImage(), numberOfPhotos: 653),
                EntitylItem(description: "Портреты", image: UIImage(systemName: "cube") ?? UIImage(), numberOfPhotos: 18),
                EntitylItem(description: "Панорамы", image: UIImage(systemName: "pano") ?? UIImage(), numberOfPhotos: 53),
                EntitylItem(description: "Замедленно", image: UIImage(systemName: "livephoto") ?? UIImage(), numberOfPhotos: 93),
                EntitylItem(description: "Серии", image: UIImage(systemName: "square.3.layers.3d.down.right") ?? UIImage(), numberOfPhotos: 54),
                EntitylItem(description: "Снимки экрана", image: UIImage(systemName: "camera.viewfinder") ?? UIImage(), numberOfPhotos: 24),
                EntitylItem(description: "Анимирование", image: UIImage(systemName: "square.stack.3d.forward.dottedline") ?? UIImage(), numberOfPhotos: 15)
            ]
        ),
        
        ModelSection(
            name: "Другое",
            items: [
                EntitylItem(description: "Имрортированные", image: UIImage(systemName: "square.and.arrow.down") ?? UIImage(), numberOfPhotos: 123),
                EntitylItem(description: "Дубликаты", image: UIImage(systemName: "square.on.square") ?? UIImage(), numberOfPhotos: 123),
                EntitylItem(description: "Скрытые", image: UIImage(systemName: "eye.slash") ?? UIImage(), numberOfPhotos: 123),
                EntitylItem(description: "Недавно удаленные", image: UIImage(systemName: "trash") ?? UIImage(), numberOfPhotos: 9)
            ]
        )
    ]
}
