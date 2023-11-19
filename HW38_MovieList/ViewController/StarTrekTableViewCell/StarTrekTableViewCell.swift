//
//  StarTrekTableViewCell.swift
//  HW38_MovieList
//
//  Created by Dawei Hao on 2023/11/19.
//

import UIKit

class StarTrekTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!

    static let identifier = "StarTrekTableViewCell"
    static func nib()-> UINib {
        return UINib(nibName: "StarTrekTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        posterImageView.layer.cornerRadius = posterImageView.bounds.height / 2
        posterImageView.clipsToBounds = true

        titleLabel.adjustsFontSizeToFitWidth  = true
        detailTitleLabel.adjustsFontSizeToFitWidth = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
