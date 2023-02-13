//

import UIKit

protocol LoginCoordinatorProtocol {
    func goToHomeTab()
}

final class LoginCoordinator: LoginCoordinatorProtocol, Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func goToHomeTab() {
        let viewController = MainTabBarController.instance()
        navigationController.pushViewController(viewController, animated: true)
    }
}
