//
//  FlightViewController.swift
//  AirQualityDrone
//
//  Created by Julian Riegger on 06.03.18.
//  Copyright © 2018 DHBW_Stuttgart. All rights reserved.
//

import UIKit
import DJISDK
import DJIUILibrary

class FlightViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var messurementPckv: UIPickerView!
    @IBOutlet var flightPckv: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func messurementProfileTv(_ sender: UITextField) {
    }
    
    @IBAction func flightRouteTv(_ sender: UITextField) {
    }
    
    @IBAction func newFlightRouteBtn(_ sender: UIButton) {
    }
    
    @IBAction func startFlightBtn(_ sender: UIButton) {
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
