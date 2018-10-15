//
//  LoadingScreen.swift
//  ParkYourRiding
//
//  Created by USER on 10/10/2018.
//  Copyright © 2018 USER. All rights reserved.
//

import UIKit
import CoreLocation

class LoadingScreen: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
                    }
        
        //print(locationManager.location)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print(location.coordinate)
            
//            showLocationEnabledPopUp()
            
        }
    
        
    }
//    func showLocationEnabledPopUp(){
//        let alertControllerEnabled = UIAlertController
//
//
//    }


    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied){
            showLocationDisabledPopUp()
        }
    }
    func showLocationDisabledPopUp(){
        let alertController = UIAlertController(title: "Backgound Location Access Disabled", message: "In order to help you find a parking lot you need to find your location", preferredStyle: .alert)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default){
            (action) in
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
    }
    
}

