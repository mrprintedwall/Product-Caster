//
//  ViewController.swift
//  Product Caster
//
//  Created by John Pili on 12/11/15.
//  Copyright © 2015 John Pili. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var interactWithBroadcastSwitch: UISwitch!
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "00000000-0000-0000-C000-000000000028")!, identifier: "ebeoo-82208D")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse
        {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
    }

    override func viewDidAppear(animated: Bool) {
//        locationManager.startRangingBeaconsInRegion(region)
    }
    
    override func viewWillDisappear(animated: Bool) {
        //locationManager.stopRangingBeaconsInRegion(region)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var productImageName = "";
    var productName = "";
    var productPrice = 0.000
    var productBrand = "";
    var lastMinor = 0;
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons)
        if(interactWithBroadcastSwitch.on == true)
        {
            //let kBeacons = beacons.filter{ $0.proximity == CLProximity.Near }
            let kBeacons = beacons.filter{ $0.rssi <= -40 }
            if kBeacons.count > 0
            {
                //let x = kBeacons.filter{ $0.rssi <= 55 }
                //if(x.count > 0)
                //{
                    let cBeacon = kBeacons[0] as CLBeacon
                    switch cBeacon.minor
                    {
                    case 1:
                        productImageName = "img1.jpg"
                        productName = "Mr. Muscle 500ml"
                        productPrice = 2.500
                        productBrand = "Kleen"
                        if(lastMinor != 1)
                        {
                            lastMinor = 1
                            self.performSegueWithIdentifier("xxx", sender: nil)
                        }
                        break
                    case 2:
                        productImageName = "img2.jpg"
                        productPrice = 2.200
                        productName = "Dettol Spray/Crisp Breeze 450ml"
                        if(lastMinor != 2)
                        {
                            lastMinor = 2
                            self.performSegueWithIdentifier("xxx", sender: nil)
                        }
                        break
                    case 3:
                        productImageName = "img3.jpg"
                        productName = "Ridsect 600ml"
                        productPrice = 3.100
                        productBrand = "S.C. Johnson"
                        if(lastMinor != 3)
                        {
                            lastMinor = 3
                            self.performSegueWithIdentifier("xxx", sender: nil)
                        }
                        break
                    default:
                        //self.view.backgroundColor = UIColor.whiteColor()
                        break
                    }

                //}
            }
            else
            {
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "xxx")
        {
            let tmp = segue.destinationViewController as! ProductDetailViewController
            tmp.productImageName = productImageName
            tmp.productName = productName
            tmp.productPrice = productPrice
            tmp.productBrand = productBrand
        }
        else
        {
        }
    }
}
