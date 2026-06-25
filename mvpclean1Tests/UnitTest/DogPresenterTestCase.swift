//
@testable import mvpclean1
import XCTest

final class DogPresenterTestCase: XCTestCase {

    private var sut: DogPresenterProtocol!
    private var view: DogViewSpy!
    private var useCase: DogUseCaseMock!

    override func setUp() {
        super.setUp()
        view = DogViewSpy()
        useCase = DogUseCaseMock()
        sut = DogPresenter(view: view, useCase: useCase)
    }

    override func tearDown() {
        sut = nil
        useCase = nil
        view = nil
        super.tearDown()
    }

    func testSetupDataWhenUseCaseSucceedsLoadsDogsAndRefreshesView() {
        let expectation = expectation(description: "Presenter publishes success state")
        view.onDataLoaded = { expectation.fulfill() }

        sut.setupData()

        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(view.didShowLoading)
        XCTAssertTrue(view.didHideLoading)
        XCTAssertTrue(view.didLoadData)
        XCTAssertEqual(sut.dogsCount(), 1)
        XCTAssertEqual(sut.dogAtIndex(IndexPath(row: 0, section: 0)).name, "doggy")
    }

    func testSetupDataWhenUseCaseFailsShowsError() {
        useCase.result = .failure(DogUseCaseMockError.failed)
        let expectation = expectation(description: "Presenter publishes error state")
        view.onError = { expectation.fulfill() }

        sut.setupData()

        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(view.didShowLoading)
        XCTAssertTrue(view.didHideLoading)
        XCTAssertTrue(view.didShowError)
        XCTAssertEqual(sut.dogsCount(), 0)
    }
}

private final class DogViewSpy: DogViewControllerDelegate {
    var didShowLoading = false
    var didHideLoading = false
    var didLoadData = false
    var didShowError = false
    var onDataLoaded: (() -> Void)?
    var onError: (() -> Void)?

    func showLoading() {
        didShowLoading = true
    }

    func hideLoading() {
        didHideLoading = true
    }

    func dataIsLoaded() {
        didLoadData = true
        onDataLoaded?()
    }

    func showError(_ error: Error) {
        didShowError = true
        onError?()
    }
}

private enum DogUseCaseMockError: Error {
    case failed
}

private final class DogUseCaseMock: DogUseCasesProtocol {
    var result: Result<[Dog], Error> = .success([
        Dog(name: "doggy", text: "nice dog", age: 3, url: "https://mydog.com/doggy1.png")
    ])

    func fetchAll(_ completion: @escaping (Result<[Dog], Error>) -> Void) {
        completion(result)
    }
}
