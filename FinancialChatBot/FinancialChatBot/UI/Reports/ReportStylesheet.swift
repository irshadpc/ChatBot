


import Foundation

let kColorBarChartControllerBackground = UIColor(hex: 0x313131)
let kColorBarChartBackground = UIColor(hex: 0x3c3c3c)
let kColorBarChartBarBlue = UIColor(hex: 0x08bcef)
let kColorBarChartBarGreen = UIColor(hex: 0x34b234)

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}

struct ChartAttributes {
    let color : UIColor
    let strokeColor : UIColor
}

extension ChartAttributes {
    
    func apply(to chart:JBBarChartView) {
        chart.backgroundColor = self.color;
    }
}

struct ReportStylesheet {
    
    var barChartAttributes : ChartAttributes {
        return ChartAttributes(
            color: kColorBarChartBackground,
            strokeColor: UIColor.greenColor())
    }
    
}
