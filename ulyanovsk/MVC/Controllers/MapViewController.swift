//
//  MapViewController.swift
//  ulyanovsk
//
//  Created by Kolesnikova Ekaterina on 28/01/16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var viewMap: GMSMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(54.3110964, longitude: 48.3261383, zoom: 10.0)
        viewMap.camera = camera
        
        self.segmentedControl.setWidth(65, forSegmentAtIndex: 0)
        self.segmentedControl.setWidth(75, forSegmentAtIndex: 2)
    }

}
