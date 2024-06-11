//

import UIKit
import Lottie

final class LoginViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lottieView: UIView!

    var presenter: LoginPresenterProtocol!
    var coordinator: LoginCoordinatorProtocol!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: Methods
    func setupUI() {

        let animationView = LottieType.login.animationView
        animationView.frame = lottieView.bounds
        lottieView.addSubview(animationView)
    }

    // MARK: Actions buttons
    @IBAction func loginTouchAction(_ sender: Any) {
        coordinator.goToHomeTab()
    }

}
