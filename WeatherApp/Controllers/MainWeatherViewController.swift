//
//  MainWeatherViewController.swift
//  WeatherApp
//
//  Created by user186640 on 11/27/20.
//

import UIKit

private  let headerIdentefier = "WeatherHeader"
private  let reuseIdentifier = "WeatherCell"

class MainWeatherViewController: UICollectionViewController {

    
   //MARK:- Proporties
    
    private var city:City?
    
    private var cityData = [CityWeather]() {
        didSet{
            collectionView.reloadData()
            
        }
    }
    
   //MARK:- LifeCycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollectionView()
       
    }
    
    /*   init(cityList:[City]){
        self.SelectedCityList = cityList
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.textStyle4 ,NSAttributedString.Key.foregroundColor: UIColor.slate]
        self.title = "Hava Durumu"
    }
    
   
    
    //MARK:- Helpers
    
    func configureUI(){
        
        view.backgroundColor = .white
       
     
       // collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 33, right: 16)
    }
    
    
    
   
    func configureCollectionView(){
        collectionView.backgroundColor = .paleGrey
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(WeatherHeader.self
                                ,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentefier)
        
      
        
    }
    
    
    //MARK:- API
    
    
    
   
    
   
}
//MARK:- UICollectionViewDelegate
extension MainWeatherViewController {
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentefier, for: indexPath) as! WeatherHeader
        
        return header
    }
    
}

//MARK:- UICollectionViewDataSource

extension MainWeatherViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WeatherCell
        
        let dayArray = ["Pazartesi","sali","carcamba","parsamba","gima","gumrtce","pazar"]
        let weatherImg = ["Group 59","Group 64","Group 476","Group 72","Group 485","Group 476","Group 476"]
        let lowTemprature = ["20C","40C","60C","80C","100C","120","140"]
        let highTemprature = ["30C","50C","70C","90C","110C","130","150"]
        
      
        cell.dayName.text = dayArray[indexPath.row]
        cell.weatherImg.image = UIImage(named: weatherImg[indexPath.row])
        cell.highTempratureLabel.text = highTemprature[indexPath.row]
        cell.lowTempratureLabel.text = lowTemprature[indexPath.row]
        
        return cell
    
    
  }
}
extension MainWeatherViewController: UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 679)
    }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: 53)
        }
    
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 33, right: 16)
    }

}
