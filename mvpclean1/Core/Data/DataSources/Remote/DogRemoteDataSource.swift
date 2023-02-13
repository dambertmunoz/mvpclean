//

import Foundation
import Alamofire

protocol DogRemoteDataSourceProtocol: BaseDataSourceProtocol {
    
}

struct DogRemoteDataSource: DogRemoteDataSourceProtocol {

    func fetchAll(_ completion: @escaping (Result<[DogEntity], Error>) -> Void) {
        // Consumir API

        AF.request("https://demo6878202.mockable.io/dogs",
                   method: .get,
                   encoding: JSONEncoding.default)
        .responseDecodable(of: [DogEntity].self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        print(error)
                    }
            }
    }
}
