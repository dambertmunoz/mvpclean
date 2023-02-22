//

import mvpclean1

struct DogRemoteRepositoryMock: DogRemoteRepositoryProtocol {

    let dataSource: DogRemoteDataSourceProtocol = DogRemoteDataSourceMock()

    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void) {
        dataSource.fetchAll(completion)
    }
}
