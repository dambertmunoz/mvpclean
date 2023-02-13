//

import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create Tab one
        let tabOne = DogViewController()
        let tabOneBarItem = UITabBarItem(title: Constants.dogsTitle,
                                         image: ImagesType.iconList.imageSystemName,
                                         selectedImage: ImagesType.iconList.imageSystemName)

        tabOne.tabBarItem = tabOneBarItem

        self.viewControllers = [tabOne]
    }
}

extension MainTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
