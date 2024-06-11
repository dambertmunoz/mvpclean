//

import Foundation
import RealmSwift

@objcMembers class DogEntity: Object, Decodable {
    dynamic var name: String?
    dynamic var text: String?
    dynamic var age: Int?
    dynamic var url: String?

    enum CodingKeys: String, CodingKey {
        case name = "dogName"
        case text = "description"
        case age
        case url
    }

//    init(name: String?, text: String?, age: Int?, url: String?) {
//        self.name = name
//        self.text = text
//        self.age = age
//        self.url = url
//    }

}

