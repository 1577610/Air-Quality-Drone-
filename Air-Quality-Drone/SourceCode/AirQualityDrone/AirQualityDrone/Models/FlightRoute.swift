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
        self.width = width //immer Breitengrad --> Norden
        self.depth = depth //immer Längengrad --> Westen
        self.measurementDensity = density
    }
    
    private func calculateWayPoints() {
        // 30m höhe in 5m Schritten --> 99:6 = 16 --> /2 --> 8
        
        var waypoint_dist: Double
        var distance: Double
        var velocity: Double
        
        if self.width >= self.depth{
            waypoint_dist = self.depth/8
            velocity = waypoint_dist
            
            waypoint_dist = meter2degree_latitude(dist_meter: waypoint_dist)
            distance = meter2degree_longitude(dist_meter: self.width)
        }
        else {
            waypoint_dist = self.width/8
            velocity = waypoint_dist
            
            waypoint_dist = meter2degree_longitude(dist_meter: waypoint_dist)
            distance = meter2degree_latitude(dist_meter: self.depth)
        }
        
    }
    
    private func createWaypoints(waypoint_dist: Double){
        
        var height: Double = 1.2
        var heightMultiplier: Int = 1
        var dist: Double = 0.0
        var maxDist: Double
        var long: Double
        var lat: Double
        var location: CLLocation
        
        if self.width > self.depth{
            maxDist = self.depth
        }
        else {
            maxDist = self.width
        }
        
        while dist < maxDist {
            var waypoint = DJIWaypoint(coordinate: <#T##CLLocationCoordinate2D#>)
            
            dist += waypoint_dist
            heightMultiplier += 1
        }
    }
    
    private func meter2degree_latitude (dist_meter: Double) -> Double {
        var dist_lat: Double
        let lat_const: Double = 111120.0 //Näherung
        dist_lat = dist_meter * (1/lat_const)
        
        return dist_lat
    }
    
    private func meter2degree_longitude (dist_meter: Double) -> Double {
        var dist_long: Double
        let long_const: Double = 25700000.0 //Näherung für Deutschland www.iaktueller.de
        dist_long = dist_meter * (1/long_const)
        
        return dist_long
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
