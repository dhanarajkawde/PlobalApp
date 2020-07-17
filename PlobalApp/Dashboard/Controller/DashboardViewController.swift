//
//  DashboardViewController.swift
//  PlobalApp
//
//  Created by Dhanraj Kawade on 15/07/20.
//  Copyright © 2020 PlobalApp. All rights reserved.
//

import UIKit

/// Class to show lidting of companies with their info
class DashboardViewController: BaseViewController {

    // MARK: IB Outlet
    @IBOutlet weak var collectionViwDashboard: UICollectionView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnSort: UIButton!
    
    // MARK: Variable declaration
    let flowLayout = UICollectionViewFlowLayout()
    let cellIdentifier = "CompanyGraphCollectionViewCell"
    
    // MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblHeader.setContentForLabel(title: Localizable.LEADERBOARD, fontSize: DynamicFont.FontSizeXL, FontName: DynamicFont.HelveticaNeue_Bold, textColor: .black)
        
        self.collectionViwDashboard.register(UINib(nibName: self.cellIdentifier, bundle: .main), forCellWithReuseIdentifier: self.cellIdentifier)
        
        self.btnSort.setContentForButton(title: Localizable.SORTBY, fontSize: DynamicFont.FontSizeXXXS, FontName: DynamicFont.HelveticaNeue_Bold, textColor: .black, backgroundColor: UIColor.white)
        self.btnSort.setImage(UIImage(named: "swap"), for: .normal)
        self.btnSort.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        self.btnSort.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        
        // Action triggered on selection
        self.singleSelectionListDropDown.selectionAction = { (index, item) in
            
            self.collectionViwDashboard.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumInteritemSpacing = 5.0
        self.collectionViwDashboard.collectionViewLayout = flowLayout
        
        if UIDevice.current.orientation.isLandscape { /// if landscape
            self.setDynamicLayout(transition: false)
            if UIDevice.current.userInterfaceIdiom == .phone { /// current device is iPhone
                flowLayout.scrollDirection = .horizontal
            }
        }
        else {
            self.setDynamicLayout()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator:

        UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if UIDevice.current.orientation.isLandscape { /// if landscape

            if UIDevice.current.userInterfaceIdiom == .phone { /// current device is iPhone
                flowLayout.scrollDirection = .horizontal
            }
        }
        else {
            flowLayout.scrollDirection = .vertical
        }
        self.flowLayout.invalidateLayout()
    }
    
    // MARK: Custom Methods
    
    
    /// Set Layout as per device and orientation
    /// - Parameter isPortrait: orientation
    func setDynamicLayout(transition isPortrait:Bool = true) {
        
        if UIDevice.current.userInterfaceIdiom == .pad { /// current device is iPad
            
            if isPortrait { /// if potrait
                
                flowLayout.itemSize = CGSize(width: self.collectionViwDashboard.frame.size.width/2 - 15, height: 300)
            }
            else {
                
                flowLayout.itemSize = CGSize(width: self.collectionViwDashboard.frame.size.width/3 - 15, height: 300)
            }
        }
        else {
            if isPortrait {
                
                flowLayout.itemSize = CGSize(width: self.collectionViwDashboard.frame.size.width - 15, height: 290)
            }
            else {
                flowLayout.itemSize = CGSize(width: self.collectionViwDashboard.frame.size.width/1.5 - 15, height: self.collectionViwDashboard.frame.size.height)
            }
        }
    }
    
    /// Button Sort Clicked
    /// - Parameter sender: sender
    @IBAction func btnSortClicked(_ sender: Any) {
        
        self.showSingleSelectionListDropdown(anchorView: self.btnSort, data: [Localizable.TotalSale.uppercased(), Localizable.AddToCart.uppercased(), Localizable.Downloads.uppercased(), Localizable.UserSessions.uppercased()])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DashboardViewController : UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let companyGraphCollectionViewCell:CompanyGraphCollectionViewCell = self.collectionViwDashboard.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! CompanyGraphCollectionViewCell
        
        companyGraphCollectionViewCell.chartView.animate(xAxisDuration: 1.0)
        
        return companyGraphCollectionViewCell
    }
}
