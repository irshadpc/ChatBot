//
//  ReportStylesheet.swift
//  FinancialChatBot
//
//  Created by Andrew Denisov on 9/16/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation
import PNChart

struct ChartAttributes {
    let color : UIColor
    let strokeColor : UIColor
}

extension ChartAttributes {
    
    func apply(to chart:PNGenericChart) {
        
    }
}

struct ReportStylesheet {
    
    var barChartAttributes : ChartAttributes {
        return ChartAttributes(
            color: UIColor.redColor(),
            strokeColor: UIColor.greenColor())
    }
    
}
