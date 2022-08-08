//
//  ArticelCell.swift
//  USNews
//
//  Created by Gökçe Kahraman on 3.08.2022.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    var numFav = 0

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var isFavoriteButtonTapped: UIButton!
    
    @IBAction func addFavNews(_ sender: UIButton) {
        
        
    if isFavoriteButtonTapped.currentImage == UIImage(systemName: "heart"){
        isFavoriteButtonTapped.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State .normal)
        self.numFav = self.numFav + 1
    }else if isFavoriteButtonTapped.currentImage == UIImage(systemName: "heart.fill"){
        isFavoriteButtonTapped.setImage(UIImage(systemName: "heart"), for: UIControl.State .normal)
        self.numFav = self.numFav - 1
    }
    }
//
//        isFavoriteButtonTapped.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State .normal)
//        self.numFav = self.numFav + 1
//        isFavoriteButtonTapped.setImage(UIImage(systemName: "heart"), for: UIControl.State .normal)
//        self.numFav = self.numFav - 1
        
//        if button.backgroundColor == UIColor.grayColor() {
//            button.backgroundColor = UIColor.blueColor()
//        }
//        else if button.backgroundColor == UIColor.blueColor() {
//            button.backgroundColor = UIColor.grayColor()
//        }
//        isFavoriteButtonTapped.image = UIImage(systemName: "info.circle.fill")
        
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
