//
//  MainTableViewCell.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var endLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var synopsisLbl: UILabel!

    var episodeObject: Anime? {
        willSet(obj) {
            self.titleLbl.text = obj?.title
            self.startLbl.text = "Start: \(obj?.start_date?.getDateString() ?? "-")"
            self.endLbl.text = "End: \(obj?.end_date?.getDateString() ?? "-")"
            self.scoreLbl.text = "Score: \(obj?.score?.description ?? "-")"
            self.synopsisLbl.text = obj?.synopsis ?? ""

            //Setting image
            ImageDownloader.shared.getImage(url: obj?.image_url) { [weak self] image in
                DispatchQueue.main.async {
                    self?.posterImage.image = image
                }
            }
        }
    }
}


class ImageDownloader {
    static let shared = ImageDownloader()
    private init() {}
    let imageCache = NSCache<NSString, UIImage>()

    func getImage(url: String?, completion:@escaping (UIImage) -> ()) {
        guard let url = url else {
            completion(UIImage(named: "template")!)
            return
        }

        if let cached = imageCache.object(forKey: url as NSString) {
            completion(cached)
        }

        DispatchQueue.global(qos: .background).async {
            if let dataUrl = URL(string: url) {
                do {
                    let data = try Data(contentsOf: dataUrl)
                    if let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url as NSString)
                        completion(image)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(UIImage(named: "template")!)
            }
        }
    }
}
