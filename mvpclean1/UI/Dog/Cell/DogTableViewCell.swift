//

import UIKit
import Kingfisher

final class DogTableViewCell: UITableViewCell, NibLoadableView {

    // MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!

    // MARK: Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Methods
    func setup(dog: Dog) {
        titleLabel.text = dog.name
        descriptionLabel.text = dog.text
        ageLabel.text = Constants.dogsAgeDescription.replacingOccurrences(of: "%@", with: "\(dog.age ?? 0)")

        if let url = dog.url {
            imageLabel.contentMode = .scaleAspectFit
            KF.url(URL(string: url)).set(to: imageLabel)
        }

    }
}
