
import Foundation
import FLKAutoLayout

private let kJBBarChartViewControllerChartHeight: CGFloat = 450
private let kJBBarChartViewControllerChartPadding: CGFloat = 40
private let kJBBarChartViewControllerChartHeaderHeight: CGFloat = 80
private let kJBBarChartViewControllerChartHeaderPadding : CGFloat = 20
private let kJBBarChartViewControllerChartFooterHeight : CGFloat  = 25

struct ReportLayout {

    func layout(chart:JBBarChartView, to view:UIView) {
        view.addSubview(chart)
        chart.frame = CGRectMake(kJBBarChartViewControllerChartPadding, kJBBarChartViewControllerChartPadding, view.bounds.size.width - (kJBBarChartViewControllerChartPadding * 2), kJBBarChartViewControllerChartHeight);
        chart.headerPadding = kJBBarChartViewControllerChartHeaderPadding;
    }
    
    func layout(chartHeader :JBChartHeaderView, to view: JBBarChartView) {
         chartHeader.frame = CGRectMake(kJBBarChartViewControllerChartPadding, ceil(view.bounds.size.height * 0.5) - ceil(kJBBarChartViewControllerChartHeaderHeight * 0.5), view.bounds.size.width - (kJBBarChartViewControllerChartPadding * 2), kJBBarChartViewControllerChartHeaderHeight)
        view.headerView = chartHeader
    }
    
    func layout(chartFooter :JBBarChartFooterView, to view: JBBarChartView) {
        chartFooter.frame = CGRectMake(kJBBarChartViewControllerChartPadding, ceil(view.bounds.size.height * 0.5) - ceil(kJBBarChartViewControllerChartFooterHeight * 0.5), view.bounds.size.width - (kJBBarChartViewControllerChartPadding * 2), kJBBarChartViewControllerChartFooterHeight)
        view.footerView = chartFooter
    }
}
