//
//  MainViewController.swift
//  AirQualityDrone
//
//  Created by Julian Riegger on 21.03.18.
//  Copyright © 2018 DHBW_Stuttgart. All rights reserved.
//

import UIKit
import DJIUILibrary

class MainViewController: UIViewController {

    @IBOutlet var batteryWidget: DULBatteryWidget!
    @IBOutlet var wifiWidget: DULWifiSignalWidget!
    @IBOutlet var GPSWidget: DULGPSSignalWidget!
    @IBOutlet var altitudeWidget: DULAltitudeWidget!
    @IBOutlet var flightStatusWidget: DULPreFlightStatusWidget!
    
    @IBOutlet var XDKConnected: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
