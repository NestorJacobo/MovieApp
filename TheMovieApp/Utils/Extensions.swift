
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(fromUrl: String) {
        let url = URL(string: fromUrl)
        self.kf.setImage(with: url)
    }
}
