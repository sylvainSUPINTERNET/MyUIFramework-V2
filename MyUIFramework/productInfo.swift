//
//  ProductInfo.swift
//  MyUIFramework
//
//  Created by SUP'Internet 15 on 01/02/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import Foundation
import UIKit
import MapKit






class ProductInfo: UIViewController, MKMapViewDelegate, UIScrollViewDelegate{
    
    var product: [String:String]!
 
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad(){
        
        self.scrollView.delegate = self
        self.scrollView.isScrollEnabled = true
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1024)
        
        
        let view = UIView()
        view.backgroundColor = .white
    
        
        
        print(product["name"]!)
        print(product["desc"]!)
        
        let product_name = UILabel()
        product_name.text = product["name"]!
        product_name.textAlignment = .center
        
        
        let product_price = UILabel()
        product_price.text = "Prix : " + product["price"]!
        product_price.textAlignment = .center
        product_price.font = product_price.font.withSize(11)
        product_price.textColor = .orange
        
        
        
        let product_date = UILabel()
        product_date.text = product["date"]!
        product_date.textAlignment = .center
        product_date.font = product_price.font.withSize(11)
        product_date.textColor = UIColor.lightGray
        
        
        let product_image = product["pic"]!
        let image = UIImage(named: product_image)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        imageView.contentMode = .scaleAspectFit
        
        
        let product_desc = UILabel()
        product_desc.text = product["desc"]!
        product_desc.font = product_desc.font.withSize(11)
        product_desc.contentMode = .scaleToFill
        product_desc.textAlignment = .justified;
        product_desc.numberOfLines = 0;
        product_desc.lineBreakMode = .byTruncatingTail;
        
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 300
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        mapView.center = view.center
        
        let artwork = Artwork(title: "King David Kalakaua",
                              locationName: "Waikiki Gateway Park",
                              discipline: "Sculpture",
                              coordinate: CLLocationCoordinate2D(latitude: Double(product["lat"]!)!, longitude: Double(product["lon"]!)!))
        mapView.addAnnotation(artwork)

        
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        let initialLocation = CLLocation(latitude: Double(product["lat"]!)!, longitude: Double(product["lon"]!)! )
            centerMapOnLocation(location: initialLocation)
        
        
        
        
        
        self.view.addSubviewGrid(view:view, grid: ["x": 0, "y": 0, "width": 12, "height": 12])
        self.view.addSubviewGrid(view: product_name,grid: ["x": 1, "y": 1, "width": 10, "height": 1])
        self.view.addSubviewGrid(view: imageView , grid: ["x": 0, "y": 1.5, "width": 12, "height": 5])
        self.view.addSubviewGrid(view: product_price , grid: ["x": 1, "y": 7, "width": 5, "height": 1])
        self.view.addSubviewGrid(view: product_date , grid: ["x": 1, "y": 6.5, "width": 20, "height": 1])
        self.view.addSubviewGrid(view: product_desc, grid: ["x": 0, "y": 8, "width": 12 , "height": 2])
        self.view.addSubviewGrid(view: mapView, grid: ["x": 0, "y": 10, "width": 12 , "height": 6])

        
    }
    
    class Artwork: NSObject, MKAnnotation {
        let title: String?
        let locationName: String
        let discipline: String
        let coordinate: CLLocationCoordinate2D
        
        init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.locationName = locationName
            self.discipline = discipline
            self.coordinate = coordinate
            
            super.init()
        }
        
        var subtitle: String? {
            return locationName
        }
    }
}
