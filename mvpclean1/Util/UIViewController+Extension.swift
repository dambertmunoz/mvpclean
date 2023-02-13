//

import UIKit

extension UIViewController {

    static func genericInstance<T: UIViewController>() -> T {
        return T.init(nibName: String(describing: self), bundle: nil)
    }

    static func instance(storyboard: String? = nil) -> Self {
        guard let storyboard = storyboard else {
            return genericInstance()
        }
        let storyboardObj = UIStoryboard(name: storyboard, bundle: nil)
        guard let instance = storyboardObj.instantiateViewController(withIdentifier: String(describing: self)) as? Self else {
            return genericInstance()
        }

        return instance
    }
}
