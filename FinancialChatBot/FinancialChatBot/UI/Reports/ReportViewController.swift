
import Foundation
import UIKit


class ReportViewController : UIViewController {
    
    private lazy var barChart : JBBarChartView = {
        let chart = JBBarChartView(frame: CGRectZero)
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
        self.view.backgroundColor = kColorBarChartControllerBackground
        setupUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        self.barChart.reloadData()
        self.barChart.setState(.Expanded , animated: true)
    }
}

private extension ReportViewController {
    
    func setupUI() {
        
        let stylesheet = ReportStylesheet()
        let barChartAttributes = stylesheet.barChartAttributes
        barChartAttributes.apply(to: barChart)
    
        barChart.minimumValue = 0.0;
        barChart.inverted = false;
        barChart.dataSource = self
        barChart.delegate = self
        
        let header = JBChartHeaderView()
        let footer = JBBarChartFooterView()
        header.apply(self.reportModel)
        footer.apply(self.reportModel)
        
        let reportLayout = ReportLayout()
        reportLayout.layout(barChart, to: self.view)
        reportLayout.layout(header, to: barChart)
        reportLayout.layout(footer, to: barChart)
    }
}

extension ReportViewController : JBBarChartViewDataSource {
    
    func category(index:UInt) -> Category {
        return self.reportModel.categories[Int(index)]
    }
    
    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
        return UInt(self.reportModel.categories.count)
    }
}

extension ReportViewController : JBBarChartViewDelegate {
    func barChartView(barChartView: JBBarChartView!, heightForBarViewAtIndex index: UInt) -> CGFloat {
        let category = self.category(index)
        return CGFloat(category.amount)
    }
    
    func barChartView(barChartView: JBBarChartView!, colorForBarViewAtIndex index: UInt) -> UIColor! {
        return (index % 2 == 0) ? kColorBarChartBarBlue : kColorBarChartBarGreen;
    }
}

private extension JBChartHeaderView {
    func apply (model: FinancialReport) {
        self.titleLabel.text = model.title
    }
}

private extension JBBarChartFooterView {
    func apply (model: FinancialReport) {
        self.leftLabel.text = model.categories.first?.type
        self.rightLabel.text = model.categories.last?.type
    }
}

