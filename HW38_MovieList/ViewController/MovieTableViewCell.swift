//
//  MovieTableViewCell.swift
//  HW38_AVPlayerViewController
//
//  Created by Dawei Hao on 2023/11/17.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!


    static let identifier = "MovieTableViewCell"

    static func nib() -> UINib {

        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
