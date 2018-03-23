//
//  BeerListViewController.swift
//  test_94
//
//  Created by Sam on 3/23/18.
//  Copyright © 2018 chuongtran. All rights reserved.
//

import UIKit

class BeerListViewController: BaseViewController {

    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    var beers = [BeerModel]()
    var page = 1
    var isLoadMore = true
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadBeerList(page:self.page, hud: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Helper

    func setupUI() {
        //TODO: setup UI here
        
    }
    
    func loadBeerList(page:Int, hud:Bool) {
        weak var weakSelf = self

        if(hud) {
            self.showHUD()
        }
        BeerService.getListBeer(page: page) { (beers, error) in
            
            if(hud) {
                weakSelf?.dismissHUD()
            }

            if(error == nil){
                    weakSelf?.isLoadMore = beers.count > 0
                    weakSelf?.beers += beers
                    weakSelf?.tableView?.reloadData()
            }else{
                weakSelf?.showAlert(title: "Oop!", message: (error?.localizedDescription)!)
            }
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "ShowBeerDetailVCIdentifier"){
            if let cell = sender as? BeerCell{
                if let indexPath = self.tableView.indexPath(for: cell){
                    if(indexPath.row < self.beers.count){
                        let beer = self.beers[indexPath.row]
                        let vc:BeerDetailViewController = segue.destination as! BeerDetailViewController
                        vc.beerID = beer.id
                    }
                }
                
            }
        }
    }
}

//MARK: - UITableViewDelegate

extension BeerListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BeerCell = tableView.dequeueReusableCell(withIdentifier: BeerCell.identifier(), for: indexPath) as! BeerCell
        
        cell.updateUI(beer: beers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //TODO: Check load more here
        if(isLoadMore && indexPath.row >= self.beers.count - 1){
            print("loadmore")
            page = page + 1
            loadBeerList(page: page, hud: false)
        }
    }
}
