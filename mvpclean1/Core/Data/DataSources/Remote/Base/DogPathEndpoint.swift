//

import Foundation

struct DogPathEndpoint {
    var baseURL: String {
        // TODO:  Handle by environment
        "https://demo6878202.mockable.io"
    }
}

extension DogPathEndpoint {

    enum EndpointType: String {
        case dogs

        var fullURL: String {
            let path = DogPathEndpoint()
            return "\(path.baseURL)/\(rawValue)"
        }
    }
}
