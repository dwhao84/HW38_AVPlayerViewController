//
//  StarTrekTableViewCell.swift
//  HW38_MovieList
//
//  Created by Dawei Hao on 2023/11/19.
//

import UIKit

class StarTrekTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var starTrekTitleLabel: UILabel!
    @IBOutlet weak var starTrekDetailTitleLabel: UILabel!

    static let identifier = "StarTrekTableViewCell"
    static func nib()-> UINib {
        return UINib(nibName: "StarTrekTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        posterImageView.layer.cornerRadius = posterImageView.bounds.width / 2
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true

        starTrekTitleLabel.adjustsFontSizeToFitWidth       = true
        starTrekDetailTitleLabel.adjustsFontSizeToFitWidth = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
