//
//  FlightRoute.swift
//  AirQualityDrone
//
//  Created by Julian Riegger on 22.03.18.
//  Copyright © 2018 DHBW_Stuttgart. All rights reserved.
//

import Foundation
import DJISDK

let flightController: DJIFlightController = DJIFlightController()

class FlightRoute: NSObject {
    
    var flightName: String
    var maxHeight: Double
    var width: Double
    var depth: Double
    
    var measurementDensity: Double
    
    var waypoints = [DJIWaypoint]()
    
    init(name: String, height: Double, width: Double, depth: Double, density: Double) {
        self.flightName = name
        self.maxHeight = height
        self.width = width
        self.depth = depth
        self.measurementDensity = density
    }
    
    private func minDistance() {
        
    }
    
    private func calculateWayPoints() {
        
    }
    
    public func getWaypoints() -> [DJIWaypoint]{
        
        return waypoints
    }
    
    private func getStartPosition() -> CLLocation?{
        
        var startPosition: CLLocation? = nil
        let completion: DJICompletionBlock? = nil
        
        flightController.setHomeLocationUsingAircraftCurrentLocationWithCompletion(completion)
        flightController.getHomeLocation { (location: CLLocation?, errorStartPosition: Error?) in
            if(location is CLLocation) {
                startPosition = location!
            }
        }
        
        return startPosition
    }
}
