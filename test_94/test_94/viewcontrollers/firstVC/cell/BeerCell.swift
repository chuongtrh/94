//
//  BeerCell.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import UIKit
import SDWebImage

class BeerCell: UITableViewCell {

    
    //MARK: - Properties
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    
    //MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Helper

    static func identifier() -> String {
        return "BeerCellIdentifier"
    }
    
    //MARK: - Public
    
    public func updateUI(beer:BeerModel!)
    {
        lbName.text = beer.name
        lbDescription.text = beer.descriptionString
        lbDescription.sizeToFit()
        
        ivImage.sd_setImage(with: URL(string:beer.image_url))
    }
    
}
