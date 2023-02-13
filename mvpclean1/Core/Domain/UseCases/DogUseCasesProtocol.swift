//

import Foundation

protocol DogUseCasesProtocol {

    func fetchAll(_ completion: @escaping (Result<[Dog], Error>) -> Void)
}
