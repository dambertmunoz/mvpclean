//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create Tab one
        let tabOne = DogViewController()
        let tabOneBarItem = UITabBarItem(title: "Dogs",
                                         image: UIImage(systemName: "list.dash"),
                                         selectedImage: UIImage(systemName: "list.dash"))

        tabOne.tabBarItem = tabOneBarItem

        self.viewControllers = [tabOne]
    }
}

extension MainTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
