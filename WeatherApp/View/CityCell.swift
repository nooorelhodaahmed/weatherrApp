//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by user186640 on 11/28/20.
//

import UIKit



class CityCell: UICollectionViewCell {

    //MARK:- Proporties

    var weather:List? {
        didSet{
            configureWeather()
        }
    }
    
    var city:City? {
        
        didSet{
            configure()
        }
    }
   
    
    private let imgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "Group 476")
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.setDimensions(width: 33, height: 35)
        return imgView
    }()
    
    private let cityName : UILabel = {
        
        let label = UILabel()
        label.font = UIFont.textStyle8
        label.textColor = UIColor.slate
        return label
    }()
    
    private let date : UILabel = {
       
        let label = UILabel()
        label.font = UIFont.textStyle2
        label.text = "7/27/2020"
        label.textColor = UIColor.purplyBlue
        return label
        
    }()
    
    private let tempratureLabel : UILabel = {
       
        let label = UILabel()
        label.font = UIFont.textStyle3
        label.text = "35C"
        label.textColor = UIColor.purplyBlue
        return label
    }()
    
    
     let deleteButton : UIButton = {
       
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Group 506"), for: .normal)
        button.tintColor = .systemRed
        button.isEnabled = true
        
        return button
    }()
    
      let dragButton :UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Group 478"), for: .normal)
        button.tintColor = .gray
        button.isEnabled = true

        return button
    }()
    
    //MARK:- LifeCycle
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        backgroundColor = .white
        //self.contentView.isUserInteractionEnabled = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK:- Helpers
    
    func configureUI() {
        
        addSubview(deleteButton)
        deleteButton.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 10)
        
    
        addSubview(imgView)
        imgView.centerY(inView: self, leftAnchor: deleteButton.rightAnchor, paddingLeft: 15.5)
        
        
        let stackView = UIStackView(arrangedSubviews: [cityName,date])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        stackView.anchor(top:topAnchor,left:imgView.rightAnchor,paddingTop: 10,paddingLeft: 30)
        
        
        addSubview(tempratureLabel)
        tempratureLabel.centerY(inView: self, leftAnchor: stackView.rightAnchor, paddingLeft: 45)
        
        
        addSubview(dragButton)
        dragButton.centerY(inView: self, leftAnchor: tempratureLabel.rightAnchor, paddingLeft: 28)
        
         
    }
    
    func configure(){
        
        guard let city = city else {return}
       
        let viewModel =  CityViewModel(city: city)
        cityName.text = viewModel.cityName
        
    }
    
    func configureWeather(){
        guard let weather = weather else {return}
        let viewModel = CityWeatherViewModel(weather: weather)
        tempratureLabel.text = String(viewModel.cityTemp!)
        
    }
    
    
    
    //MARK:- Selectors
    
    
   
    
}
    
    
