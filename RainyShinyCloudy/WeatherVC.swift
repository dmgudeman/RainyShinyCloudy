//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by David Gudeman on 8/11/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  @IBOutlet weak var dateLbl: UILabel!
  @IBOutlet weak var currentTempLbl: UILabel!
  @IBOutlet weak var locationLbl: UILabel!
  @IBOutlet weak var currentWeatherImage: UIImageView!
  @IBOutlet weak var currentWeatherLbl: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
  
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
}

