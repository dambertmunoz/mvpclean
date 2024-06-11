//

import UIKit

enum ImagesType: String {
    case iconList = "list.dash"
    case person = "person.fill"

    var imageSystemName: UIImage? {
        UIImage(systemName: rawValue)
    }
}
