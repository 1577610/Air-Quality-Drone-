//
//  FlightViewController.swift
//  AirQualityDrone
//
//  Created by Julian Riegger on 21.03.18.
//  Copyright © 2018 DHBW_Stuttgart. All rights reserved.
//

import UIKit
import DJIUILibrary

class FlightViewController: UIViewController {

    @IBOutlet var flightName: UITextField!
    
    @IBOutlet var depthTF: UITextField!
    @IBOutlet var widthTF: UITextField!
    @IBOutlet var heightTF: UITextField!
    @IBOutlet var flightRouteTF: UITextField!
    
    @IBOutlet var map: DULMapWidget!
    
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var widthSlider: UISlider!
    @IBOutlet var depthSlider: UISlider!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var comboTF: UITextField!
    
    var height: Double = 0.0
    var width: Double = 0.0
    var depth: Double = 0.0
    
    var measurementDensity: Double = 1.0 //measurements per meter
    
    var name: String = "Name"
    
    var flightRoutes: [FlightRoute] = []
    var activeFlightRoute: FlightRoute = FlightRoute(name: "initial", height: 0.0, width: 0.0, depth: 0.0, density: 0.0)
    
    func configureComboBox() {
        comboTF.inputView = pickerView
    }
    
    @IBAction func flitghRouteTFTouched(_ sender: UITextField) {
        
    }
    
    @IBAction func safeBtnCommand(_ sender: UIButton) {
        var newFlightRoute: FlightRoute
        newFlightRoute = FlightRoute(name: name, height: height, width: width, depth: depth, density: measurementDensity)
        activeFlightRoute = newFlightRoute
        
        flightRoutes.append(newFlightRoute)
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        name = String(describing: sender.text)
    }
    
    func configureSlider() {
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 30
        widthSlider.minimumValue = 0
        widthSlider.maximumValue = 30
        depthSlider.minimumValue = 0
        depthSlider.maximumValue = 30
    }
    
    @IBAction func heightSliderValueChanged(_ sender: UISlider) {
        height = Double(sender.value)
        
        heightTF.text = String(format: "%.2f", height)
    }
    
    @IBAction func widthSliderValueChanged(_ sender: UISlider) {
        width = Double(sender.value)
        
        widthTF.text = String(format: "%.2f", width)
    }
    
    @IBAction func depthSliderValueChanged(_ sender: UISlider) {
        depth = Double(sender.value)
        
        depthTF.text = String(format: "%.2f", depth)
    }
    
    @IBAction func startFlightBtn(_ sender: UIButton) {
        initWaypointMission()
        
    }
    
    func initWaypointMission () {
        let waypoints: [DJIWaypoint] = activeFlightRoute.getWaypoints()
        let waypointMission = DJIMutableWaypointMission()
        
        waypointMission.removeAllWaypoints()
        
        for waypoint in waypoints {
            waypointMission.add(waypoint)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSlider()
        configureComboBox()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
