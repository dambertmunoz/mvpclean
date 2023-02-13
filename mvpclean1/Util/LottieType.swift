//

import Foundation
import Lottie

enum LottieType: String {
    case login = "loginLottie"
    case loading

    var animationView: LottieAnimationView {
        let animationView = LottieAnimationView(name: rawValue)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        return animationView
    }
}
