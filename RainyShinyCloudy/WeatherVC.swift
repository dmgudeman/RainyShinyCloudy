//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by David Gudeman on 8/11/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  @IBOutlet weak var dateLbl: UILabel!
  @IBOutlet weak var currentTempLbl: UILabel!
  @IBOutlet weak var locationLbl: UILabel!
  @IBOutlet weak var currentWeatherImage: UIImageView!
  @IBOutlet weak var currentWeatherLbl: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  var currentWeather: CurrentWeather!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    currentWeather = CurrentWeather()
    currentWeather.downloadWeatherDetails {
      // setup ui to load downloaded data
      self.updateMainUI()
    }
  
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
    return cell
    
  }
  
  func updateMainUI (){
    dateLbl.text = currentWeather.date
    currentTempLbl.text = "\(currentWeather.currentTemp)"
    currentWeatherLbl.text = currentWeather.weatherType
    locationLbl.text = currentWeather.cityName
    currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    
  }
}

