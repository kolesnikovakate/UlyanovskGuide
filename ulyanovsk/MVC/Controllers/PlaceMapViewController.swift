//
//  PlaceMapViewController.swift
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 13.02.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

import UIKit

class PlaceMapViewController: UIViewController {
    
    var place: Place!
    @IBOutlet weak var viewMap: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude((self.place.lat?.doubleValue)!, longitude: (self.place.lon?.doubleValue)!, zoom: 15.0)
        viewMap.camera = camera
        
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: (self.place.lat?.doubleValue)!, longitude: (self.place.lon?.doubleValue)!))
        marker.icon = GMSMarker.markerImageWithColor( self.place.isKindOfClass(Hotel.classForCoder()) ? UIColor.blueColor() : UIColor.redColor())
        marker.title = self.place.title
        marker.map = viewMap;

    }

}
