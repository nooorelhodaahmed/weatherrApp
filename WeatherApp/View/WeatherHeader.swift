//
//  HeaderView.swift
//  WeatherApp
//
//  Created by user186640 on 11/28/20.
//

import UIKit


class WeatherHeader : UICollectionReusableView {
    
    
    //MARK:- Proporties
   
    var city : City? {
        didSet {
            configureUI()
        }
    }
    var search = SearchController()
    
    private var scView:UIScrollView!
    private let buttonPadding:CGFloat = 10
    private var xOffset:CGFloat = 10
    private var arrayofCity =  ["","","","",""]
    
    
    private var headerView : UIView = {
       
        let view = UIView()
        view.backgroundColor = .white
       // view.setDimensions(width: 343, height: 169)
        view.layer.cornerRadius = 12
        return view
        
    }()
    
    private var WeatherImage : UIImageView = {
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = #imageLiteral(resourceName: "Group 579")
        imgView.setDimensions(width: 88, height: 92)
        return imgView
        
    }()
    
    private let tempratureLabel : UILabel = {
        
       let label = UILabel()
       label.text = "35C"
       label.font = UIFont.robotoRegular40
       label.textColor = UIColor.purplyBlue
       return label
    }()
    
    private let locationLable : UILabel = {
        
       let label = UILabel()
       label.text = "Açık, güneşli"
       label.font = UIFont.textStyle8
       label.textColor = .slate
       return label
    }()
    
    private let dateLabel : UILabel = {
        
       let label = UILabel()
       label.text = "7/27/2020"
       label.textColor = UIColor.purplyBlue
       label.font = UIFont.textStyle2
       return label
        
    }()
    
    private let spratorLine : UIImageView = {
       
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "Rectangle 413")
        imgView.contentMode = .scaleAspectFit
        
        return imgView
        
    }()
    
    private let highTempratureLable : UILabel = {
      
        let label = UILabel()
        label.font = UIFont.textStyle6
        label.textColor = UIColor.slate
        label.text = "38"
        
        
        return label
    }()
    
    private let highTempratureImage: UIImageView = {
        
       let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "Path 5144")
        return imgView
        
    }()
    
    private let lowTempratureLable : UILabel = {
        let label = UILabel()
        label.font = UIFont.textStyle6
        label.textColor = UIColor.slate
        label.text = "28"
        return label
    }()
    
    private let lowTempratureImage: UIImageView = {
        
       let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "Path 5543")
        return imgView
        
    }()
    
    private let weatherDetailsView : UIView = {
       
        let view = UIView()
        view.backgroundColor = .white
        view.setDimensions(width: 343, height: 120)
        return view
        
    }()
    
    //MARK:-LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setScrollView ()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Helpers
    
    func configureUI(){
        
        scView = UIScrollView(frame: CGRect(x: 0, y: 120, width: bounds.width, height: 50))
        addSubview(scView)
        addSubview(headerView)
        headerView.anchor(top: topAnchor,left:leftAnchor,right: rightAnchor,paddingTop: 181,paddingLeft: 16,paddingRight: 16)
        
        headerView.addSubview(WeatherImage)
        WeatherImage.centerY(inView: headerView)
        WeatherImage.anchor(left:leftAnchor,paddingLeft: 28.7)
        
        let stackView = UIStackView(arrangedSubviews:[tempratureLabel,locationLable,dateLabel])
        headerView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillProportionally
        stackView.anchor(top: headerView.topAnchor,left:WeatherImage.rightAnchor,paddingTop: 43, paddingLeft: 30)
        
        headerView.addSubview(spratorLine)
        spratorLine.anchor(top:headerView.topAnchor,left: stackView.rightAnchor,paddingTop: 33,paddingLeft: 22.5)
        spratorLine.centerY(inView: headerView)
        spratorLine.setDimensions(width: 2, height: 100)
        
        let upStackView = UIStackView(arrangedSubviews: [highTempratureImage,highTempratureLable])
        upStackView.axis = .horizontal
        upStackView.spacing = 8.7
        upStackView.distribution = .fillEqually
        
        headerView.addSubview(upStackView)
        upStackView.anchor(top:headerView.topAnchor,right: headerView.rightAnchor,paddingTop: 55.9,paddingRight: 26)
        
        let downStackView = UIStackView(arrangedSubviews: [lowTempratureImage,lowTempratureLable])
        
        downStackView.axis = .horizontal
        downStackView.spacing = 8.7
        downStackView.distribution = .fillEqually
        
        headerView.addSubview(downStackView)
        downStackView.anchor(top: upStackView.bottomAnchor,right: headerView.rightAnchor,paddingTop: 15,paddingRight: 26)
        
        
        let weatherImageStackView = UIStackView(arrangedSubviews: [weatherImgView(withImg: #imageLiteral(resourceName: "Group 472")),weatherImgView(withImg: #imageLiteral(resourceName: "Group 71")),weatherImgView(withImg: #imageLiteral(resourceName: "Group 38")),weatherImgView(withImg: #imageLiteral(resourceName: "Group 59")),weatherImgView(withImg: #imageLiteral(resourceName: "Group 39"))])
        
        addSubview(weatherImageStackView)
        weatherImageStackView.anchor(top:headerView.bottomAnchor,left:leftAnchor,right: rightAnchor,paddingTop: 32,paddingLeft: 16,paddingRight: 16)
        weatherImageStackView.axis = .horizontal
        weatherImageStackView.distribution = .fillEqually
        weatherImageStackView.spacing = 17
        
        let weatherTimeStackView = UIStackView(arrangedSubviews: [weatherTimeView(withtime: "06:00"),weatherTimeView(withtime: "03:00"),weatherTimeView(withtime: "18:00"),weatherTimeView(withtime: "21:00"),weatherTimeView(withtime: "24:00")])
        
        addSubview(weatherTimeStackView)
        weatherTimeStackView.anchor(top:weatherImageStackView.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 12,paddingLeft:  16,paddingRight: 16)
        weatherTimeStackView.axis = .horizontal
        weatherTimeStackView.distribution = .fillEqually
        weatherTimeStackView.spacing = 42
        
        
        addSubview(weatherDetailsView)
        weatherDetailsView.anchor(top: weatherTimeStackView.bottomAnchor, left: leftAnchor,right: rightAnchor,paddingTop: 66,paddingLeft: 16,paddingRight: 16)
        
        let detailedWeatherData1 = UIStackView(arrangedSubviews :[weatherDetailsView(withImg: #imageLiteral(resourceName: "Path 5541"), withTitle: "Rüzgar", withValue: "16 mhs/s") ,weatherDetailsView(withImg: #imageLiteral(resourceName: "Path 5555"), withTitle: "Nem", withValue: "64")])
        
        addSubview(detailedWeatherData1)
        detailedWeatherData1.anchor(top:weatherDetailsView.topAnchor,left: weatherDetailsView.leftAnchor,paddingTop: 17,paddingLeft: 19.6)
        detailedWeatherData1.spacing = 26
        detailedWeatherData1.axis = .vertical
        
        
        let detailedWeatherData2 = UIStackView(arrangedSubviews :[weatherDetailsView(withImg: #imageLiteral(resourceName: "Group 52"), withTitle: "Görünürlük", withValue: "32 km") ,weatherDetailsView(withImg: #imageLiteral(resourceName: "Group 51"), withTitle: "UV", withValue: "1,2")])
        
        addSubview(detailedWeatherData2)
        detailedWeatherData2.anchor(top:weatherDetailsView.topAnchor,right: weatherDetailsView.rightAnchor,paddingTop: 17,paddingRight:  48)
        detailedWeatherData2.spacing = 26
        detailedWeatherData2.axis = .vertical
        
    }
    
    func setScrollView () {
        
        
        scView.backgroundColor = UIColor.white
        scView.translatesAutoresizingMaskIntoConstraints = false

        for i in 0 ... arrayofCity.count-1 {
         let button = UIButton(type: .system)
             button.tag = i
             button.backgroundColor = UIColor.purplyBlue
             button.setTitleColor(UIColor.white, for: .normal)
           
            button.setTitle(arrayofCity[i], for: .normal)
             button.addTarget(self, action: #selector(btnTouch), for: UIControl.Event.touchUpInside)

             button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 99, height: 25)
             button.layer.cornerRadius = 10
           /* button.setBackgroundColor(color: UIColor.purplyBlue, forState: .selected)
            button.setBackgroundColor(color: UIColor.clear, forState: .normal)
            let unSelectedAttributeTitle = NSAttributedString(string: arrayofCity[i], attributes: [NSAttributedString.Key.foregroundColor : UIColor.slate,NSAttributedString.Key.font : UIFont.textStyle5])
            let selectedAttributedTitle = NSAttributedString(
             string: arrayofCity[i], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,NSAttributedString.Key.font : UIFont.textStyle7])
         
            button.setAttributedTitle(selectedAttributedTitle, for: .selected)
            button.setAttributedTitle(unSelectedAttributeTitle, for: .normal)
         
        
           // button.setDimensions(width: 99, height: 25)*/
         
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            scView.addSubview(button)


        }

        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)

    }
    
    func weatherImgView(withImg  image: UIImage) -> UIView {
       
        let view = UIImageView()
        view.image = image
        view.backgroundColor = .white
        view.setDimensions(width: 55, height: 55)
        view.image = image
        view.contentMode = .scaleAspectFit
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
        
    }
    
    func weatherTimeView (withtime time: String)-> UILabel{
        let label = UILabel()
        label.textColor = .slate
        label.font = UIFont.textStyle9
        return label
        
    }
    
    func weatherDetailsView(withImg img:UIImage,withTitle title: String,withValue value:String) -> UIStackView {
        
        
        let  imgView = UIImageView()
        imgView.image = img
        imgView.contentMode = .scaleAspectFit
        
        
        
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.textStyle9
        titleLabel.textColor = UIColor.slate
        //titleLabel.setDimensions(width: 38, height: 14)
        titleLabel.text = title
        
        let valueLabel = UILabel()
        valueLabel.font = UIFont.textStyle10
        valueLabel.textColor = .slate
      
      //  valueLabel.setDimensions(width: 50, height: 14)
        valueLabel.text = value
        
        let subStackView = UIStackView(arrangedSubviews: [titleLabel,valueLabel])
        subStackView.axis = .vertical
        subStackView.spacing = 2
        subStackView.distribution = .fillProportionally
       
        
        let stackView = UIStackView(arrangedSubviews: [imgView,subStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10.6
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        
        
        return stackView
    }
    
    
    func configure(){
        
      /*  guard let city = city else {return}
        let viewModel =  CityViewModel(city: city)
        let x = viewModel.cityName
        arrayofCity!.append(x!)*/
    }
    
    //MARK:- Selectors

    @objc func btnTouch(){
        print("button touched")
    }
}
