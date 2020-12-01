//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by user186640 on 11/28/20.
//

import UIKit


class WeatherCell : UICollectionViewCell {
    
    
    
    
    //MARK:-Proporties
    
   
    
     var dayName : UILabel = {
       
        let label = UILabel()
        label.textColor = UIColor.slate
        label.font = UIFont.textStyle9
        return label
    
    }()
    
    var weatherImg: UIImageView = {
        
       let imgView = UIImageView()
       imgView.contentMode = .scaleAspectFit
       imgView.clipsToBounds = true
       imgView.layer.masksToBounds = true
       return imgView
        
    }()
    
    var highTempratureLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont.textStyle8
        label.textColor = UIColor.slate
        return label
        
    }()
    
    
    var lowTempratureLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont.textStyle11
        label.textColor = UIColor.blueGrey
        return label
        
    }()
    
    //MARK:-LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Helpers
    
    func configureUI() {
        
        backgroundColor = .white
       
        
        addSubview(dayName)
        dayName.anchor(top :topAnchor,left:leftAnchor,paddingTop: 26,paddingLeft:  24)
        
        let stackView = UIStackView(arrangedSubviews: [weatherImg,highTempratureLabel,lowTempratureLabel])
        stackView.axis = .horizontal
        stackView.spacing = 18
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
        stackView.centerY(inView: self)
        stackView.anchor(right:rightAnchor,paddingRight: 30)
    
        
    }
    
    
    
    
    
    
}
