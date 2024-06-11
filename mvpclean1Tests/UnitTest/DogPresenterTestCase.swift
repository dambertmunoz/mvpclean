//
@testable import mvpclean1
import XCTest

final class DogPresenterTestCase: XCTestCase {

    var sut: DogPresenterProtocol

    override func setUp() {

        sut = DogPresenter(view: <#T##DogViewControllerDelegate#>, useCase: DogUseCases(mapper: <#T##DogMapperProtocol#>))
    }


}
