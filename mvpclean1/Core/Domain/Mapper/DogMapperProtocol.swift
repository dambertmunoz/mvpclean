//

import Foundation

protocol DogMapperProtocol {
    func toDomain(_ dogs: [DogEntity]) -> [Dog]
}
