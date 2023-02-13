//

import UIKit

enum ImagesType: String {
    case iconList = "list.dash"

    var imageSystemName: UIImage? {
        UIImage(systemName: "list.dash")
    }
}
