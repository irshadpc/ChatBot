//
//  ReportViewController.swift
//  FinancialChatBot
//
//  Created by Andrew on 9/14/16.
//  Copyright © 2016 Andrew Denisov. All rights reserved.
//

import Foundation
import UIKit
import PNChart

class ReportViewController : UIViewController {
    
    private lazy var barChart : PNBarChart = {
        let chart = PNBarChart(frame: CGRectZero)
        return chart
    }()
    
    private var reportModel : FinancialReport
    
    init(reportData : FinancialReport) {
        self.reportModel = reportData
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension ReportViewController {
    
    func setupUI() {
        let reportLayout = ReportLayout()
        let stylesheet = ReportStylesheet()
        let barChartAttributes = stylesheet.barChartAttributes
        
        barChartAttributes.apply(to: barChart)
        reportLayout.layout(chart: barChart, to: self.view)
        barChart.apply(self.reportModel)
        barChart.strokeChart()
    }
}

private extension PNBarChart {
    func apply (data: FinancialReport) {
        
    }
}

