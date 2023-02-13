//

import Foundation
import Realm
import RealmSwift

protocol DogLocalDataSourceProtocol: BaseDataSourceProtocol {

    func isEmpty(_ completion: @escaping (Bool) -> Void)
    func save(dogs: [DogEntity], _ completion: @escaping (Bool) -> Void)
}

struct DogLocalDataSource: DogLocalDataSourceProtocol {

    func fetchAll(_ completion: (Result<[DogEntity], Error>) -> Void) {

        do {
            let realm: Realm = try Realm()
            let dogs = Array(realm.objects(DogEntity.self))
            completion(.success(dogs))
        } catch {
            completion(.failure(error))
            print(error)
        }

    }

    func isEmpty(_ completion: (Bool) -> Void) {
        // RealM

        do {
            let realm: Realm = try Realm()

            let exist = realm.objects(DogEntity.self).isEmpty

            completion(exist)

        } catch {
            print(error)
        }
    }
    
    func save(dogs: [DogEntity], _ completion: @escaping (Bool) -> Void) {

        do {
            let realm: Realm = try Realm()
            try realm.write {
                realm.add(dogs)
            }
        } catch {
            print(error)
        }
    }

}
