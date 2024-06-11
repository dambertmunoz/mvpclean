//

import mvpclean1

struct DogLocalRepositoryMock: DogLocalRepositoryProtocol {

    let dataSource: DogLocalDataSourceProtocol = DogLocalDataSourceMock()

    func isEmpty(_ completion: @escaping (Result<Bool, Error>) -> Void) {
        dataSource.isEmpty(completion)
    }

    func save(dogs: [DogEntity], _ completion: @escaping (Result<Bool, Error>) -> Void) {
        dataSource.save(dogs: dogs, completion)
    }

    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void) {
        dataSource.fetchAll(completion)
    }
}
