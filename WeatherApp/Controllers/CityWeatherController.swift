//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by user186640 on 11/27/20.
//

import UIKit

protocol selectedCityProtocol {
    
  func handleSelectedCity (cities: [City])
  func handleSelectedCityData(cityWeather:[List])
}

private let reuseIdentifier = "CityCell"

class CityWeatherController: UICollectionViewController {
   
    
    //MARK:- Proporties
    
    
   
    
    var SelectedCityList = [City]()
    var selectedCityWeatherDta = [List]()
        
       
       
    private var isEdit : Bool = false
   
 
    //MARK:-LifeCycle


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNaigationItem()
        configureCollectionView()
      
    }
    

    
    
    //MARK:-Hellpers
   
    
    
    func configureCollectionView(){
        collectionView.backgroundColor = .paleGrey
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: reuseIdentifier)
       
        
    }
    
    func setNaigationItem() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.textStyle4 ,NSAttributedString.Key.foregroundColor: UIColor.slate]
        self.title = "Şehirler"
        let rightButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Group 504"), style: .plain, target: self, action: #selector(addCity))
        navigationItem.rightBarButtonItem = rightButton
        
        let leftButton = UIBarButtonItem(title: "Düzenle", style: .plain, target: self, action: #selector(editCity))
        navigationItem.leftBarButtonItem = leftButton
        
    }
    
    
    //MARK:- Selector
    
    @objc func addCity() {
        
        let vc = SearchController()
       
        vc.delegate = self
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func editCity() {
        
        isEdit.toggle()
        collectionView.reloadData()
    }
    
    @objc func handleDeleteAction(sender:UIButton) {
        
        self.SelectedCityList.remove(at: sender.tag)
        collectionView.reloadData()
    }
    
    @objc func handleDragAndDrop() {
        
        
    }
    
    
   
    
}


    
    //MARK:- UICollectionViewDataSource

    extension CityWeatherController {
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            SelectedCityList.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            

            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CityCell
            
           
            cell.city = SelectedCityList[indexPath.row]
            cell.weather = selectedCityWeatherDta[indexPath.row] 
            
            if self.isEdit {
                cell.deleteButton.isHidden = false
                cell.dragButton.isHidden = false
                cell.deleteButton.addTarget(self, action: #selector(handleDeleteAction), for: .touchUpInside)
                cell.dragButton.addTarget(self, action: #selector(handleDragAndDrop), for: .touchUpInside)
                
            }
            else {
                cell.deleteButton.isHidden = true
                cell.dragButton.isHidden = true
                
            }
        
           
            return cell
        
        }
        
        
        
   }

    extension CityWeatherController: UICollectionViewDelegateFlowLayout {
           
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
                return CGSize(width: view.frame.width, height: 55)
            }
        
        
       
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 120, left: 16, bottom: 16, right: 100)
        }
        
           
    }

extension CityWeatherController: selectedCityProtocol {
    
    func handleSelectedCityData(cityWeather: [List]) {
        self.selectedCityWeatherDta = cityWeather
        collectionView.reloadData()
    }

    
    func handleSelectedCity (cities: [City]){
        
        self.SelectedCityList = cities
        collectionView.reloadData()
        
    }
}

