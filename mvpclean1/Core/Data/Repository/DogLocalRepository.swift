//

import Foundation

protocol DogLocalRepositoryProtocol: BaseRepositoryProtocol {

    func isEmpty(_ completion: @escaping (Bool) -> Void)
    func save(dogs: [DogEntity], _ completion: @escaping (Bool) -> Void)
}

struct DogLocalRepository: DogLocalRepositoryProtocol {

    // MARK: Properties
    let dataSource: DogLocalDataSourceProtocol

    init(dataSource: DogLocalDataSourceProtocol = DogLocalDataSource()) {
        self.dataSource = dataSource
    }

    func isEmpty(_ completion: @escaping (Bool) -> Void) {
        dataSource.isEmpty(completion)
    }

    func save(dogs: [DogEntity], _ completion: @escaping (Bool) -> Void) {
        dataSource.save(dogs: dogs, completion)
    }

    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void) {
        dataSource.fetchAll(completion)
    }
}
