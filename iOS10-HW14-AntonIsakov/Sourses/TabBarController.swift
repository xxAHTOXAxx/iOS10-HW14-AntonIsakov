import UIKit

final class MainTabBarController: UITabBarController {
    static func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController ()
        tabBarController.setViewControllers(
            [
                createChildViewController(controller: FirstTabBarViewController(), title: "Медиатека", image:
                                            UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0),
                createChildViewController(controller: SecondTabBarViewController(), title: "Для Bac", image:
                                            UIImage (systemName: "heart.text.square.fill"), tag: 1),
                createChildViewController(controller: CompositionalLayoutViewController(), title: "Альбомы",
                                          image: UIImage(systemName: "rectangle.stack.fill"), tag: 2),
                createChildViewController(controller: FourthTabBarViewController(), title: "Поиск",
                                          image: UIImage (systemName: "magnifyingglass"), tag: 3) ],
            animated: true
        )
        tabBarController.selectedIndex = 2
        return tabBarController
    }
    private static func createChildViewController (controller: UIViewController, title: String,
                                                   image: UIImage?, tag: Int) -> UIViewController {
        let viewController = controller
        let navigationController = UINavigationController (rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        viewController.title = title
        navigationController.navigationBar.topItem?.titleView?.tintColor = .clear
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .white
        return navigationController
    }
}
