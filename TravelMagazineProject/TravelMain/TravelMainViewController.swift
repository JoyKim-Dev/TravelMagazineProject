//
//  TravelMainViewController.swift
//  TravelMagazineProject
//
//  Created by Joy Kim on 5/26/24.
//

import UIKit
import Tabman
import Pageboy

class TravelMainViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let travelVc = UIStoryboard.init(name: "TravelMain", bundle: nil).instantiateViewController(withIdentifier: "TravelMainViewController") as! TravelMainViewController
        let restaurantVc = UIStoryboard.init(name: "TravelMain", bundle: nil).instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        
        viewControllers.append(travelVc)
        viewControllers.append(restaurantVc)
        
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
       
}

extension TravelMainViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "Page \(index)"
        item.image = UIImage(named: "image.png")
        // ↑↑ 이미지는 이따가 탭바 형식으로 보여줄 때 사용할 것이니 "이미지가 왜 있지?" 하지말고 넘어가주세요.
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}



