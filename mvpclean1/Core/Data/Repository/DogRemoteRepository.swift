//

import Foundation

protocol DogRemoteRepositoryProtocol: BaseRepositoryProtocol {
    
}

struct DogRemoteRepository: DogRemoteRepositoryProtocol {

    // MARK: Properties
    let dataSource: DogRemoteDataSourceProtocol

    init(dataSource: DogRemoteDataSourceProtocol = DogRemoteDataSource()) {
        self.dataSource = dataSource
    }

    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void) {
        dataSource.fetchAll(completion)
    }
}
