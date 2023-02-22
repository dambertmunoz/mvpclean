//

import mvpclean1

struct DogRemoteDataSourceMock: DogRemoteDataSourceProtocol {

    func fetchAll(_ completion: (Result<[DogEntity], Error>) -> Void) {

        completion(.success(DogStub.dogs))
    }
}
