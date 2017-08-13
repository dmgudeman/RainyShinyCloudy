//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by David Gudeman on 8/12/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let WEATHER = "weather?"
let LATTITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "d162d6f35112972011a622f68f572859"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER)\(LATTITUDE)37.4419\(LONGITUDE)122.1430\(APP_ID)\(APP_KEY)"



let FORECAST_URL = "https://api.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=d162d6f35112972011a622f68f572859"

