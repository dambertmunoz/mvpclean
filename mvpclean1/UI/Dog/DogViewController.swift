//

import UIKit

protocol DogViewControllerDelegate: AnyObject {

    func showLoading()
    func hideLoading()
    func dataIsLoaded()
    func showError(_ error: Error)
}

final class DogViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet weak var dogTableView: UITableView!
    var presenter: DogPresenterProtocol!

    // MARK: Inits
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dogTableView.register(DogTableViewCell.self)
        presenter = DogPresenter(view: self)
        presenter.setupData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension DogViewController: DogViewControllerDelegate {

    func showLoading() {
        showLoadingView()
    }

    func hideLoading() {
        hideLoadingView()
    }

    func dataIsLoaded() {
        dogTableView.reloadData()
        hideLoading()
    }
    
    func showError(_ error: Error) {
        // TO DO: Show Error, manage custom error
    }
}

extension DogViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dogsCount()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: DogTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)

        let dog = presenter.dogAtIndex(indexPath)
        cell.setup(dog: dog)

        return cell
    }
    
}
