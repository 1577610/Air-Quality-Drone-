//
//  MyPickerView.swift
//  AirQualityDrone
//
//  Created by Julian Riegger on 24.03.18.
//  Copyright © 2018 DHBW_Stuttgart. All rights reserved.
//

import Foundation
import UIKit

class MyPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    

    
}
