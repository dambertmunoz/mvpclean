//

import mvpclean1

struct DogLocalDataSourceMock: DogLocalDataSourceProtocol {

    func fetchAll(_ completion: (Result<[DogEntity], Error>) -> Void) {

        completion(.success(DogStub.dogs))
    }

    func isEmpty(_ completion: @escaping (Result<Bool, Error>) -> Void) {

        completion(.success(false))
    }

    func save(dogs: [DogEntity], _ completion: @escaping (Result<Bool, Error>) -> Void) {

        completion(.success(true))
    }
}
