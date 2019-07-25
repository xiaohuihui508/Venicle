//
//  PieMarkerView.swift
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

import Foundation
import Charts

open class PieMarkerView: BalloonMarker
{
    open override func refreshContent(entry: ChartDataEntry, highlight: Highlight)
    {
        if let newEntry = entry as? PieChartDataEntry {
            setLabel(newEntry.label!)
        }
    }
}
