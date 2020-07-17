//
//  CompanyGraphCollectionViewCell.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 17/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit
import Charts

/// Enum to identify button selection
enum TypeOfButton {
    
    case TotalSales
    case AddToCart
    case Downloads
    case UserSessions
}

/// Class show company details
class CompanyGraphCollectionViewCell: UICollectionViewCell {

    // MARK: IB Outlet
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblCompanyType: UILabel!
    @IBOutlet weak var lblCompanyTotalSales: UILabel!
    @IBOutlet weak var lblCompanyTotalSalesValue: UILabel!
    @IBOutlet weak var btnTotalSales: UIButton!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var btnDownloads: UIButton!
    @IBOutlet weak var btnUserSessions: UIButton!
    @IBOutlet weak var viwBack: UIView!
    @IBOutlet weak var chartView: LineChartView!
    
    // MARK: Variable declaration
    weak var axisFormatDelegate: IAxisValueFormatter?
    var selectedBtn:TypeOfButton = .TotalSales
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    /// Configure Cell
    override func awakeFromNib() {
        super.awakeFromNib()
              
        self.setUpUI()
        self.setUpData()
        
        self.axisFormatDelegate = self
        self.chartView.setUpLineChart()
        self.chartView.animate(xAxisDuration: 1.0)
        
        self.updateChartData()
    }
    
    // MARK: Custom Methods
    
    /// Set up UI
    func setUpUI() {
        
        self.btnTotalSales.setContentForButton(title: Localizable.TotalSale, fontSize: DynamicFont.FontSizeXXXXXS, FontName: DynamicFont.HelveticaNeue_Bold, textColor: .black, backgroundColor: UIColor.lightGray.withAlphaComponent(0.3))
        self.btnAddToCart.setContentForButton(title: Localizable.AddToCart, fontSize: DynamicFont.FontSizeXXXXXS, FontName: DynamicFont.HelveticaNeue_Regular, textColor: .black, backgroundColor: .white)
        self.btnDownloads.setContentForButton(title: Localizable.Downloads, fontSize: DynamicFont.FontSizeXXXXXS, FontName: DynamicFont.HelveticaNeue_Regular, textColor: .black, backgroundColor: .white)
        self.btnUserSessions.setContentForButton(title: Localizable.UserSessions, fontSize: DynamicFont.FontSizeXXXXXS, FontName: DynamicFont.HelveticaNeue_Regular, textColor: .black, backgroundColor: .white)
        
        self.btnTotalSales.layer.cornerRadius = self.btnTotalSales.frame.size.height/2
        self.btnTotalSales.layer.borderColor = GlobalColors.colorLightGray.cgColor
        self.btnTotalSales.layer.borderWidth = 1.0
        
        self.btnAddToCart.layer.cornerRadius = self.btnTotalSales.frame.size.height/2
        self.btnAddToCart.layer.borderColor = GlobalColors.colorLightGray.cgColor
        
        self.btnDownloads.layer.cornerRadius = self.btnTotalSales.frame.size.height/2
        self.btnDownloads.layer.borderColor = GlobalColors.colorLightGray.cgColor
        
        self.btnUserSessions.layer.cornerRadius = self.btnTotalSales.frame.size.height/2
        self.btnUserSessions.layer.borderColor = GlobalColors.colorLightGray.cgColor
        
        self.viwBack.layer.cornerRadius = 10.0
        self.viwBack.addShadow(offset: CGSize(width: 0, height: 0), color: GlobalColors.colorLightGray, radius: 10, opacity: 0.4)
    }
    
    /// Set up Data
    func setUpData() {
        
        self.lblCompanyName.setContentForLabel(title: "Johnson Company", fontSize: DynamicFont.FontSizeXS, FontName: DynamicFont.HelveticaNeue_Bold, textColor: .black)
        self.lblCompanyType.setContentForLabel(title: "Fashion & Apparal", fontSize: DynamicFont.FontSizeXXXS, FontName: DynamicFont.HelveticaNeue_Light, textColor: .black)
        self.lblCompanyTotalSales.setContentForLabel(title: "Total Sales", fontSize: DynamicFont.FontSizeXXXS, FontName: DynamicFont.HelveticaNeue_Regular, textColor: .black)
        self.lblCompanyTotalSalesValue.setContentForLabel(title: "GBP 6,872,876", fontSize: DynamicFont.FontSizeXXS, FontName: DynamicFont.HelveticaNeue_Bold, textColor: .black)
    }
    
    /// Pass data to chart
    func updateChartData() {
        chartView.data = nil
        
        self.setDataCount(Int(7), range: UInt32(100))
    }
    
    /// Create random data from received data
    /// - Parameter count: x values
    /// - Parameter range: y values
    func setDataCount(_ count: Int, range: UInt32) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: val, data: months as AnyObject?)
        }
        
        let set1 = LineChartDataSet(entries: values, label: "")
        set1.drawValuesEnabled = false
        set1.drawIconsEnabled = false
        
        set1.setColor(UIColor.lightGray.withAlphaComponent(0.4))
        set1.setCircleColor(UIColor.lightGray.withAlphaComponent(0.4))
        set1.lineWidth = 1
        set1.circleRadius = 4
        set1.drawCircleHoleEnabled = false
        
        let gradientColors = [UIColor.lightGray.withAlphaComponent(0.4).cgColor,
                              UIColor.lightGray.withAlphaComponent(0.1).cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        
        chartView.data = data
        
        let xAxisValue = chartView.xAxis
        xAxisValue.valueFormatter = axisFormatDelegate
    }
    
    /// Button Total Sales clicked
    /// - Parameter sender: sender
    @IBAction func btnTotalSaleClicked(_ sender: UIButton) {
        
        if self.selectedBtn != .TotalSales { /// avoid to re selecting same button
            self.fadeOutAnimation()
            self.fadeInAnimation(type: .TotalSales)
            self.selectedBtn = .TotalSales
        }
    }
    
    /// Button Add to Cart clicked
    /// - Parameter sender: sender
    @IBAction func btnAddToCartClicked(_ sender: UIButton) {
        
        if self.selectedBtn != .AddToCart { /// avoid to re selecting same button
            self.fadeOutAnimation()
            self.fadeInAnimation(type: .AddToCart)
            self.selectedBtn = .AddToCart
        }
    }
    
    /// Button Downloads clicked
    /// - Parameter sender: sender
    @IBAction func btnDownloadClicked(_ sender: UIButton) {
        
        if self.selectedBtn != .Downloads { /// avoid to re selecting same button
            self.fadeOutAnimation()
            self.fadeInAnimation(type: .Downloads)
            self.selectedBtn = .Downloads
        }
    }
    
    /// Button User Sessionsclicked
    /// - Parameter sender: sender
    @IBAction func btnUserSessionsClicked(_ sender: UIButton) {
        
        if self.selectedBtn != .UserSessions { /// avoid to re selecting same button
            self.fadeOutAnimation()
            self.fadeInAnimation(type: .UserSessions)
            self.selectedBtn = .UserSessions
        }
    }
    
    /// fade In animation
    /// - Parameter type: set animation for selected button
    func fadeInAnimation(type:TypeOfButton) {
        
        if type == .TotalSales { /// if selected Total sales
            
            self.setGrayBackground(btn: self.btnTotalSales)
        }
        else if type == .AddToCart { /// if selected Add to cart
            
            self.setGrayBackground(btn: self.btnAddToCart)
        }
        else if type == .Downloads { /// if selected Downloads
            
            self.setGrayBackground(btn: self.btnDownloads)
        }
        else {
            
            self.setGrayBackground(btn: self.btnUserSessions)
        }
        
        self.setDataCount(Int(7), range: UInt32(100))
        self.chartView.animate(xAxisDuration: 1.0)
    }
    
    /// fade out animation
    func fadeOutAnimation() {
                
        if self.selectedBtn == .TotalSales { /// if deselected Total sales
            
            self.setWhiteBackground(btn: self.btnTotalSales)
        }
        else if selectedBtn == .AddToCart { /// if deselected Add to cart
            
            self.setWhiteBackground(btn: self.btnAddToCart)
        }
        else if selectedBtn == .Downloads { /// if deselected Downloads
            
            self.setWhiteBackground(btn: self.btnDownloads)
        }
        else {
            
            self.setWhiteBackground(btn: self.btnUserSessions)
        }
    }
    
    /// fade out with white background with animation
    /// - Parameter btn: selected button
    func setWhiteBackground(btn:UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            btn.backgroundColor = .white
            btn.layer.borderWidth = 0.0
            btn.backgroundColor?.withAlphaComponent(1.0)
            btn.titleLabel?.font = DynamicFont.shared.getSpecificFont(size: DynamicFont.FontSizeXXXXXS, fontName: DynamicFont.HelveticaNeue_Regular)
        })
    }
    
    /// fade In with Gray background with animation
    /// - Parameter btn: selected button
    func setGrayBackground(btn:UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            btn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            btn.layer.borderWidth = 1.0
            btn.titleLabel?.font = DynamicFont.shared.getSpecificFont(size: DynamicFont.FontSizeXXXXXS, fontName: DynamicFont.HelveticaNeue_Bold)
        })
    }
}

// MARK: - IAxisValueFormatter
extension CompanyGraphCollectionViewCell: IAxisValueFormatter {
    
    /// Convert integer to month
    /// - Parameter value: value
    /// - Parameter axis: axis
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {

        return months[Int(value)]
    }
}
