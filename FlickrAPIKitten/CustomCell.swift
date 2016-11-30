//
//  CustomCell.swift
//  FlickrAPIKitten
//
//  Created by Peter Leung on 30/11/2016.
//  Copyright © 2016 winandmac Media. All rights reserved.
//

import UIKit
import Kingfisher

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var kittenImageView: UIImageView!
    
    func configureCell(inputPosts: Posts){
        if let thumbImg = inputPosts.thumbImageLink {
            kittenImageView.kf.setImage(with: URL(string: thumbImg))
        }
    }
}
