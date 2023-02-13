//

import Foundation
import Realm
import RealmSwift

protocol DogLocalDataSourceProtocol: BaseDataSourceProtocol {

    func isEmpty(_ completion: @escaping (Result<Bool, Error>) -> Void)
    func save(dogs: [DogEntity], _ completion: @escaping (Result<Bool, Error>) -> Void)
}

struct DogLocalDataSource: DogLocalDataSourceProtocol {

    func fetchAll(_ completion: (Result<[DogEntity], Error>) -> Void) {

        do {
            let realm: Realm = try Realm()
            let dogs = Array(realm.objects(DogEntity.self))
            completion(.success(dogs))
        } catch {
            completion(.failure(error))
        }

    }

    func isEmpty(_ completion: @escaping (Result<Bool, Error>) -> Void) {
        // RealM

        do {
            let realm: Realm = try Realm()

            let exist = realm.objects(DogEntity.self).isEmpty

            completion(.success(exist))

        } catch {
            completion(.failure(error))
        }
    }
    
    func save(dogs: [DogEntity], _ completion: @escaping (Result<Bool, Error>) -> Void) {

        do {
            let realm: Realm = try Realm()
            try realm.write {
                realm.add(dogs)
            }
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }

}
