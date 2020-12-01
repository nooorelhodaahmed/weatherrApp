//
//  searchCell.swift
//  WeatherApp
//
//  Created by user186640 on 11/29/20.
//

import UIKit

protocol addcity : class {
    
    func addCity (_ cell: SearchCell)
}

class SearchCell: UITableViewCell {

    var city : City? {
        didSet {
            configureUI()
        }
    }

    weak var delegate : addcity?
    
    var cityName : UILabel = {
        
       let label = UILabel()
        label.textColor = .slate
        label.font = UIFont.textStyle8
        
        return label
    }()
    
    var button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ekle", for: .normal)
        button.setTitleColor(.purplyBlue, for: .normal)
        button.addTarget(self, action: #selector(handleAddCity), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        addSubview(cityName)
        cityName.anchor(top:topAnchor ,left:leftAnchor,paddingTop: 11, paddingLeft: 16)
        
        addSubview(button)
        button.anchor(top:topAnchor,right: rightAnchor,paddingTop: 11,paddingRight: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Helper
    func configureUI() {
        guard let city = city else {return}
        let viewModel = CityViewModel(city: city)
        cityName.text = viewModel.cityName
    }
    
    
    //MARK:- selector
    
    @objc func handleAddCity() {
        delegate?.addCity(self)
    }
}
