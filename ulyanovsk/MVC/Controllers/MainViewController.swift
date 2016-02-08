//
//  MainViewController.swift
//  ulyanovsk
//
//  Created by Kolesnikova Ekaterina on 28/01/16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openListVC" {
            guard let button = sender as? UIButton else { return }
            guard let controller = segue.destinationViewController as? ListViewController else { return }
            controller.isShowplace = button.tag == 1;
        }
        
    }
    
    @IBAction func openListVCAction(sender: UIButton) {
        self.performSegueWithIdentifier("openListVC", sender: sender)
    }
}
