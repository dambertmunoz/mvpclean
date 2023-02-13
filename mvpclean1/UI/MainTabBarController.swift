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

        let dogVC = DogViewController()
        let tabOneBarItem = UITabBarItem(title: Constants.dogsTitle,
                                         image: ImagesType.iconList.imageSystemName,
                                         selectedImage: ImagesType.iconList.imageSystemName)

        dogVC.tabBarItem = tabOneBarItem

        let profileVC = ProfileViewController()
        let tabSecondBarItem = UITabBarItem(title: Constants.profileTitle,
                                         image: ImagesType.person.imageSystemName,
                                         selectedImage: ImagesType.person.imageSystemName)
        profileVC.tabBarItem = tabSecondBarItem

        self.viewControllers = [dogVC, profileVC]
    }
}

extension MainTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
