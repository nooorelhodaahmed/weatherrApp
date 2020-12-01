//
//  MainTabBarController.swift
//  WeatherApp
//
//  Created by user186640 on 11/27/20.
//

import UIKit




class MainTabBarController: UITabBarController {
    
    //MARK:-proporties
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    
        let tabBarItemSize = CGSize(width: 135.8, height: 45)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.veryLightPink, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
            
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.purplyBlue],for: .selected)
        //UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: -5, vertical: -5)
        
        
    }
    
    
   
}
