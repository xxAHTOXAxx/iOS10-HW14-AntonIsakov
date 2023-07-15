import UIKit

struct ModelItem: Hashable {
    var description: String?
    var image: UIImage?
    var numberOfPhotos: Int?
}

struct ModelSection: Hashable {
    var name: String
    var items: [ModelItem]
}

extension ModelSection {
    
    static var modelSectionArray = [
        ModelSection(
            name: "Мои альбомы",
            items: [
                ModelItem(description: "Недавние", image: UIImage(named: "BMW") ?? UIImage() , numberOfPhotos: 6),
                ModelItem(description: "Избранное", image: UIImage(named: "tiger") ?? UIImage(), numberOfPhotos: 226),
                ModelItem(description: "WhatsApp", image: UIImage(named: "WhiteBear") ?? UIImage(), numberOfPhotos: 436),
                ModelItem(description: "Instagram", image: UIImage(named: "moto") ?? UIImage(), numberOfPhotos: 116),
                ModelItem(description: "Viber", image: UIImage(named: "Sea") ?? UIImage(), numberOfPhotos: 73),
                ModelItem(description: "Another", image: UIImage(named: "dog") ?? UIImage(), numberOfPhotos: 56),
                ModelItem(description: "Facebook", image: UIImage(named: "dog2") ?? UIImage(), numberOfPhotos: 54),
                ModelItem(description: "My photo", image: UIImage(named: "bob") ?? UIImage(), numberOfPhotos: 21)
            ]
        ),
        
        ModelSection(
            name: "Люди и места",
            items: [
                ModelItem(description: "Люди", image: UIImage(named: "moto") ?? UIImage(), numberOfPhotos: 123),
                ModelItem(description: "Места", image: UIImage(named: "dog") ?? UIImage(), numberOfPhotos: 123)
            ]
        ),
        
        ModelSection(
            name: "Типы медиафайлов",
            items: [
                ModelItem(description: "Видео", image: UIImage(systemName: "video") ?? UIImage(), numberOfPhotos: 123),
                ModelItem(description: "Селфи", image: UIImage(systemName: "person.crop.square") ?? UIImage(), numberOfPhotos: 76),
                ModelItem(description: "Фото Live Photos", image: UIImage(systemName: "livephoto") ?? UIImage(), numberOfPhotos: 653),
                ModelItem(description: "Портреты", image: UIImage(systemName: "cube") ?? UIImage(), numberOfPhotos: 18),
                ModelItem(description: "Панорамы", image: UIImage(systemName: "pano") ?? UIImage(), numberOfPhotos: 53),
                ModelItem(description: "Замедленно", image: UIImage(systemName: "livephoto") ?? UIImage(), numberOfPhotos: 93),
                ModelItem(description: "Серии", image: UIImage(systemName: "square.3.layers.3d.down.right") ?? UIImage(), numberOfPhotos: 54),
                ModelItem(description: "Снимки экрана", image: UIImage(systemName: "camera.viewfinder") ?? UIImage(), numberOfPhotos: 24),
                ModelItem(description: "Анимирование", image: UIImage(systemName: "square.stack.3d.forward.dottedline") ?? UIImage(), numberOfPhotos: 15)
            ]
        ),
        
        ModelSection(
            name: "Другое",
            items: [
                ModelItem(description: "Имрортированные", image: UIImage(systemName: "square.and.arrow.down") ?? UIImage(), numberOfPhotos: 123),
                ModelItem(description: "Дубликаты", image: UIImage(systemName: "square.on.square") ?? UIImage(), numberOfPhotos: 123),
                ModelItem(description: "Скрытые", image: UIImage(systemName: "eye.slash") ?? UIImage(), numberOfPhotos: 123),
                ModelItem(description: "Недавно удаленные", image: UIImage(systemName: "trash") ?? UIImage(), numberOfPhotos: 9)
            ]
        )
    ]
}
