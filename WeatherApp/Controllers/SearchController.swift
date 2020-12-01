//
//  SearchController.swift
//  WeatherApp
//
//  Created by user186640 on 11/29/20.
//

import UIKit





private let reuseIdentifier = "SearchCell"

class SearchController: UITableViewController {
 

    
    //MARK:- Propoorties
    
    var addedCity = [City]() {
        didSet{
            fetchWeatherData()
        }
    }
        
    
     var cityData = [List]()
    
     var delegate: selectedCityProtocol?
   
    
    private var allCities = [City]() {
        didSet{
            tableView.reloadData()
            
        }
    }
    private var filteredCities = [City]() {
        
        didSet{
            tableView.reloadData()
        }
    }
    
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
   private let searchController = UISearchController(searchResultsController: nil)
    
    
    
    //MARK:- lifeCycel
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(goBack))
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.handleSelectedCity(cities: addedCity)
        delegate?.handleSelectedCityData(cityWeather: cityData)
        
    }
    
    @objc func goBack () {
       
        
        if addedCity.count < 3{
         
            let alert = UIAlertController(title: "uyarı", message: "Lütfen en az 3 şehir seçin", preferredStyle: .alert)

            self.present(alert, animated: true)
            alert.addAction(UIAlertAction(title: "tmam", style: .default, handler: nil))
            
        }
        
        else {
            
            
            self.navigationController?.popViewController(animated: true)
        }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
        fetchCities()
       
        configureSearchController()
        
        
        
    }
    
   

    
    //MARK:- Api
      
    
    func fetchCities(){
        
        CityAPI.shared.getDataFromApi(withUrl: (EndPiont.strUrl)) { cities in
            self.allCities = cities
        }
        
    }
    
    
    func fetchWeatherData() {
        
        for i in 0...addedCity.count-1 {
           
            CityWeatherAPI.shared.getWeatherDataFromApi(url: EndPiont.weatherUrl, parameters: ["q": String(addedCity[i].name!),"appid":"b1b15e88fa797225412429c1c50c122a1"]) { [self]  (response) in
                   
                cityData.append(response.list![0])
            
            }
            
        }
      
        
    }
    

    
    //MARK:- Helper
    
    
    
    func configureUI(){
        
        view.backgroundColor = .white
        tableView.register(SearchCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delegate = self
        
    }
    
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a city"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        
        
    }


    
    
}

//MARK:- IUTableViewDelegate/DatSource

extension SearchController{
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inSearchMode ? filteredCities.count : allCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        
        
        let city = inSearchMode ? filteredCities[indexPath.row] : allCities[indexPath.row]
        cell.cityName.text = city.name
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        addedCity.append(allCities[indexPath.row])
       
        
    }

}


extension SearchController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        filteredCities = allCities.filter({ ($0.name!.contains(searchText) ) })
        
    }
}


extension SearchController : addcity {


    func addCity(_ cell: SearchCell) {
        addedCity.append(cell.city!)
    }
    
    
}
