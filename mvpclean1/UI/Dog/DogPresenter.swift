//

import Foundation

protocol DogPresenterProtocol {
    func setupData()
    func dogAtIndex(_ index: IndexPath) -> Dog
    func dogsCount() -> Int
}

final class DogPresenter: DogPresenterProtocol {

    // MARK: Properties
    weak var view: DogViewControllerDelegate?
    var useCase: DogUseCasesProtocol

    private var dogs: [Dog] = []

    // MARK: Inits
    init(view: DogViewControllerDelegate, useCase: DogUseCasesProtocol = DogUseCases()) {
        self.view = view
        self.useCase = useCase
    }

    func setupData() {
        view?.showLoading()
        useCase.fetchAll { result in
            self.view?.hideLoading()
            switch result {
            case .success(let success):
                self.dogs = success
                self.view?.dataIsLoaded()
            case .failure(let failure):
                self.view?.showError(failure)
            }
        }
    }

    func dogAtIndex(_ index: IndexPath) -> Dog {
        return dogs[index.row]
    }

    func dogsCount() -> Int {
        return dogs.count
    }
}
