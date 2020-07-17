//
//  LineChart+Extension.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 17/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import Foundation
import Charts

extension LineChartView {
    
    func setUpLineChart() {
        
        self.xAxis.labelPosition = .bottom
        self.xAxis.drawGridLinesEnabled = false
        self.leftAxis.drawGridLinesEnabled = false
        self.xAxis.avoidFirstLastClippingEnabled = true
        self.xAxis.granularity = 1.0
        let yAxis = self.getAxis(YAxis.AxisDependency.right)
        yAxis.drawGridLinesEnabled = false
        self.legend.enabled = false
        
        self.drawBordersEnabled = false
        self.leftAxis.drawLabelsEnabled = false
        self.leftAxis.enabled = false
        self.leftAxis.drawGridLinesEnabled = false
        self.rightAxis.enabled = false
        self.legend.enabled = false
        self.contentMode = .bottom
        self.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        self.xAxis.labelCount = 7
    }
}
