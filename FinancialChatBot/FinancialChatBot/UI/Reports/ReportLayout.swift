//
//  ReportLayout.swift
//  FinancialChatBot
//
//  Created by Andrew on 9/14/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation
import FLKAutoLayout

struct ReportLayout {

    func layout(chart chart:UIView, to view:UIView) {
        view.addSubview(chart)
        chart.alignTopEdgeWithView(view, predicate: String(50))
        chart.constrainWidthToView(view, predicate: String(0))
        chart.constrainHeight(String(200))
    }
}
