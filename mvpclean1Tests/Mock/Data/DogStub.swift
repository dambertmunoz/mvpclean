//

@testable import mvpclean1

final class DogStub {
    static let dogs: [DogEntity] {
        let dog = DogEntity()
        dog.name = "doggy"
        dog.text = "nice dog"
        dog.age = 3
        dog.url = "https://mydog.com/doggy1.png"
        return [dog]
    }
}
