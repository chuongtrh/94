//
//  BeerDetailViewController.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import UIKit

class BeerDetailViewController: BaseViewController {

    
    //MARK: - Properties
    public var beerID:Int32 = 0
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbFirstBrewed: UILabel!
    @IBOutlet weak var lbIngredients: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBarDetail()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Helper
    
    func loadBarDetail(){
        weak var weakSelf = self
        if(beerID > 0){
            showHUD()
            BeerService.getBeerDetail(id: beerID) { (beer, error) in
                weakSelf?.dismissHUD()
                if(error == nil){
                    weakSelf?.updateUI(beer: beer!)
                }
            }
        }
    }

    func updateUI(beer:BeerModel) {
        lbName.text = beer.name
        lbDescription.text = beer.descriptionString
        lbDescription.layoutIfNeeded()
        
        ivImage.sd_setImage(with: URL(string:beer.image_url))

        lbFirstBrewed.text = beer.first_brewed
        
        let attString = beer.ingredients?.getTextAtrribute()
        lbIngredients.attributedText = attString
        lbIngredients.layoutIfNeeded()
        
        contentView.layoutIfNeeded()

        let estimateHeight = lbIngredients.frame.size.height
        if #available(iOS 11.0, *) {
            scrollView.contentSize = CGSize(width: contentView.frame.width, height: 480 + estimateHeight + self.view.safeAreaInsets.bottom + self.view.safeAreaInsets.top)
        } else {
            // Fallback on earlier versions
            scrollView.contentSize = CGSize(width: contentView.frame.width, height: 480 + estimateHeight + 64)
        }
    }
}
