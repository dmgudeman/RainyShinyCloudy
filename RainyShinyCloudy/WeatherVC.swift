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
  var forecast: Forecast!
  var forecasts = [Forecast]()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    currentWeather = CurrentWeather()
  
    
    currentWeather.downloadWeatherDetails {
      // setup ui to load downloaded data
      self.downloadForecastData {
        self.updateMainUI()
      }
          }
  
  }
  
  func downloadForecastData(completed: DownloadComplete) {
    //Downloading forecast weather data for Tableview
    Alamofire.request(FORECAST_URL).responseJSON {response in
      let result = response.result
      if let dict = result.value as? Dictionary<String, AnyObject> {
        if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
          for obj in list {
            let forecast = Forecast(weatherDict:obj)
            self.forecasts.append(forecast)
            print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHH \( obj)")
          }
        }
        
      }
    
    }
     completed()
    
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

