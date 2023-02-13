//

import Foundation

protocol BaseRepositoryProtocol {
    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void)
}
