//
//  StoryCell.swift
//  FGCKitSampleApp
//
//  Created by Daniel Bachar on 30/04/2018.
//  Copyright © 2018 FatGingerCat LT. All rights reserved.
//

import Foundation
import UIKit

class StoryCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imageView.image = nil
    }
    
}
