//

import Foundation

struct DogPathEndpoint {
    var baseURL: String {
        MVPConfiguration.getValueFor("base_URL") ?? ""
        // TODO:  Handle by environment
        // "https://demo6878202.mockable.io"
    }
}

extension DogPathEndpoint {

    enum EndpointType: String {
        case dogs

        var fullURL: String {
            let path = DogPathEndpoint()
            let result = "\(path.baseURL)/\(rawValue)"
            print(result)
            return result
        }
    }
}
