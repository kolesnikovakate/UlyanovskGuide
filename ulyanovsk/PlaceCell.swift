//
//  PlaceCell.swift
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 25.01.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeInfoLabel: UILabel!
    @IBOutlet weak var placeRatingLabel: UILabel!
    @IBOutlet weak var placeReviewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateWithModel(place: Place) {
        self.placeTitleLabel.text = place.title
        self.placeInfoLabel.text = place.info
        self.placeRatingLabel.text = "\(place.rating)"
        self.placeReviewsLabel.text = relativeTimeWithPlural(place.reviews!.count)
        if let photos = place.photos as! NSArray? {
            let url : NSURL = NSURL(string: photos.firstObject as! String)!
        self.placeImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    func relativeTimeWithPlural(num :Int) -> String
    {
        let forms = [ "отзыв", "отзыва", "отзывов" ];
        let plural : String = num % 10 == 1 && num % 100 != 11 ? forms[0] : (num % 10 >= 2 && num % 10 <= 4 && (num % 100 < 10 || num % 100 >= 20) ? forms[1] : forms[2]);
        return "\(num) \(plural)"
    }

}
