//

import Foundation

struct DogMapper: DogMapperProtocol {
    func toDomain(_ dogs: [DogEntity]) -> [Dog] {
        return dogs.compactMap {
            Dog(name: $0.name, text: $0.text, age: $0.age, url: $0.url)
        }
    }
}
