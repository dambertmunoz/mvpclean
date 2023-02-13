//

import Foundation

protocol BaseDataSourceProtocol {
    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void)
}
