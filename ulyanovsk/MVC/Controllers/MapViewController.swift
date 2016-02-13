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
    
    var showplaceMarkers: NSArray! {
        let showplaceArray = [] as NSMutableArray
        let array = Showplace.MR_findAll()! as NSArray
        array.enumerateObjectsUsingBlock { (place, i, stop) -> Void in
            guard let place = place as? Place else { return }
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: (place.lat?.doubleValue)!, longitude: (place.lon?.doubleValue)!))
            marker.icon = GMSMarker.markerImageWithColor(UIColor.redColor())
            marker.title = place.title
            marker.map = self.viewMap;
            
            showplaceArray.addObject(marker)
        }
        return showplaceArray
    }
    
    var hotelMarkers: NSArray! {
        let showplaceArray = [] as NSMutableArray
        let array = Hotel.MR_findAll()! as NSArray
        array.enumerateObjectsUsingBlock { (place, i, stop) -> Void in
            guard let place = place as? Place else { return }
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: (place.lat?.doubleValue)!, longitude: (place.lon?.doubleValue)!))
            marker.icon = GMSMarker.markerImageWithColor(UIColor.blueColor())
            marker.title = place.title
            marker.map = self.viewMap;
            
            showplaceArray.addObject(marker)
        }
        return showplaceArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Карта"
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(54.311, longitude: 48.550, zoom: 9.6)
        viewMap.camera = camera
        
        self.segmentedControl.setWidth(65, forSegmentAtIndex: 0)
        self.segmentedControl.setWidth(75, forSegmentAtIndex: 2)
        
        self.segmentValueChanged(self.segmentedControl)
    }

    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        self.viewMap.clear()
        
        if (sender.selectedSegmentIndex == 0 || sender.selectedSegmentIndex == 1) {
            self.showplaceMarkers.enumerateObjectsUsingBlock { (marker, i, stop) -> Void in
                guard let marker = marker as? GMSMarker else { return }
                marker.map = self.viewMap
            }
        }
        
        if (sender.selectedSegmentIndex == 0 || sender.selectedSegmentIndex == 2) {
            self.hotelMarkers.enumerateObjectsUsingBlock { (marker, i, stop) -> Void in
                guard let marker = marker as? GMSMarker else { return }
                marker.map = self.viewMap
            }
        }
    }
}
