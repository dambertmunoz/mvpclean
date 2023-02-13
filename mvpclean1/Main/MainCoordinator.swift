//

import UIKit

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LoginViewController.instance()
        vc.coordinator = LoginCoordinator(navigationController: navigationController)
        vc.presenter = LoginPresenter()
        navigationController.pushViewController(vc, animated: false)
    }
}
