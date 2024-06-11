//

import UIKit
import Lottie

class BaseViewController: UIViewController {

    func showLoadingView() {
        let animationView = LottieType.loading.animationView
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.play()
    }

    func hideLoadingView() {

        view.subviews.forEach { view in
            if view is LottieAnimationView {
                view.removeFromSuperview()
            }
        }
    }
}
