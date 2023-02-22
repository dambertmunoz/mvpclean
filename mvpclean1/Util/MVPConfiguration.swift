//

import Foundation

final class MVPConfiguration {

    static func getValueFor(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
    }
}
