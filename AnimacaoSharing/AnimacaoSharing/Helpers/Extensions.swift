//  Created by Paul Hudson and modified by Lucas Fernandez Nicolau.
// https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview
//

import UIKit

extension UIImageView {
    func load(imgUrl: String) {
        guard let imgUrl = URL(string: imgUrl) else { return }
        self.load(imgUrl: imgUrl)
    }

    func load(imgUrl: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imgUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
