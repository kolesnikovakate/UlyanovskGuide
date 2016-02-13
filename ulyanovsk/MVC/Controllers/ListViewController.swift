//
//  ListViewController.swift
//  ulyanovsk
//
//  Created by Kolesnikova Ekaterina on 28/01/16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var isShowplace: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.title = isShowplace ? "Достопримечательности" : "Гостиницы";
    }
    
    lazy var frc: NSFetchedResultsController = {
        if (self.isShowplace) {
            return Showplace.MR_fetchAllSortedBy(
                "title",
                ascending: true,
                withPredicate: nil,
                groupBy: nil,
                delegate: self
            )
        }
        return Hotel.MR_fetchAllSortedBy(
            "title",
            ascending: true,
            withPredicate: nil,
            groupBy: nil,
            delegate: self
        )
        
    }()
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (frc.fetchedObjects?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "list_cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let place : Place = frc.objectAtIndexPath(indexPath) as! Place
        let titleLabel = cell.viewWithTag(1) as! UILabel
        titleLabel.text = place.title;
        let infoLabel = cell.viewWithTag(2) as! UILabel
        infoLabel.text = place.info;
        
        let imageView = cell.viewWithTag(3) as! UIImageView
        imageView.sd_setImageWithURL(NSURL(string: "https://arcane-brook-20885.herokuapp.com/\(place.image!)"), placeholderImage: UIImage(named: "placeholder"))
        
        
        let ratingLabel = cell.viewWithTag(4) as! UILabel
        let rating = Int(arc4random_uniform(UInt32(10 + 1)))
        ratingLabel.text = "\(rating)";
        
        let reviewsLabel = cell.viewWithTag(5) as! UILabel
        reviewsLabel.text = self.relativeTimeWithPlural((place.reviews?.count)!);
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.openDetailVCWithIndexPath(indexPath)
    }
    
    func openDetailVCWithIndexPath(indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewControllerWithIdentifier("DetailsVC") as? DetailsViewController else { return }
        vc.place = frc.objectAtIndexPath(indexPath) as! Place
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func relativeTimeWithPlural(num : Int) -> String {
        let forms = [ "отзыв", "отзыва", "отзывов" ]
        let plural = num % 10 == 1 && num % 100 != 11 ? forms[0] : (num % 10 >= 2 && num % 10 <= 4 && (num % 100 < 10 || num % 100 >= 20) ? forms[1] : forms[2]);
        return "\(num) \(plural)";
    }
}
