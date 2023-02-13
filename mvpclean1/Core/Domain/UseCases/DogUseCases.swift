//

import Foundation

struct DogUseCases: DogUseCasesProtocol {

    // MARK: Properties
    let mapper: DogMapperProtocol

    // MARK: Inits
    init(mapper: DogMapperProtocol = DogMapper()) {
        self.mapper = mapper
    }

    // MARK: Methods
    func fetchAll(_ completion: @escaping (Result<[Dog], Error>) -> Void) {

        // 1. Valid if empty data from local datasource
        let localRepository = DogLocalRepository()
        localRepository.isEmpty({ isLocalEmpty in
            // 2. If data doesnt exist, repository inits with .remote
            var fetchAllRepository: BaseRepositoryProtocol = localRepository
            if isLocalEmpty {
                fetchAllRepository = DogRemoteRepository()
            }
            // 3. Fetch all Data
            fetchAllRepository.fetchAll { result in
                switch result {
                case .success(let data):
                    // 4. Save data if data is not saved in local
//                    if isLocalEmpty {
//                        localRepository.save(dogs: data, {_ in } )
//                    }
                    completion(.success(self.mapper.toDomain(data)))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
        })
    }
}
