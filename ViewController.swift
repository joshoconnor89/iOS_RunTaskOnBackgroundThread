//
//  ViewController.swift
//  WeatherFeather
//
//  Created by Joshua O'Connor on 8/22/15.
//  Copyright (c) 2015 Joshua O'Connor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel?
    
    @IBOutlet weak var currentHumidityLabel: UILabel?
    
    @IBOutlet weak var currentRainLabel: UILabel?
    
    //https://developer.forecast.io/ <--API source
    private let weatherAPIkey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Lets chop up our URL
        let baseWeatherURL = NSURL (string: "https://api.forecast.io/forecast/\(weatherAPIkey)/")
        let weatherURL = NSURL (string: "37.8267,-122.423", relativeToURL: baseWeatherURL)
        
        //Example URL, put in browser to see our JSON response:
        //https://api.forecast.io/forecast/9301f53588e5404881534e7a842abcd6/37.8267,-122.423
        
        //Data object to fetch weather data. NSData performs a network call when used
        //let weatherData = NSData (contentsOfURL: weatherURL!, options: nil, error: nil)
        
        //Fetch data off main queue.  We don't want to slow down main queue, lets perform in the background thread.
        //Use NSURL Session API to fetch data
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        //NSURLDataTask & NSURLSessionDownloadTask.  Latter saves to disk.  First saves directly to app.
        
        //NSURLRequest Object
        let request = NSURLRequest(URL: weatherURL!)
        
        //Our closure as callback mechanism.
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            VERY IMPORTANTE!!  Comment out after read.  Any code below is ran in background!!
            //Anything in here is loaded on a background thread!
            
            println(data)
        })
        
        dataTask.resume()
        
        

        
        
        
       
        
        //Our pList Path
        //Code only executes if we can load all the files.  Prevents crashing.
        /*
        if let plistPath = NSBundle.mainBundle().pathForResource("WeatherData", ofType: "plist"),
        let weatherDataDictionary = NSDictionary(contentsOfFile: plistPath),
        let currentWeatherDictionary = weatherDataDictionary["currently"] as? [String: AnyObject]{
        
            
            let currentWeather = Weather(weatherDictionary: currentWeatherDictionary)
        
        
            currentTempLabel?.text = "\(currentWeather.temperature)º"
            
            currentHumidityLabel?.text = "\(currentWeather.humidity)%"
            
            currentRainLabel?.text = "\(currentWeather.probabilityOfPrecipitation)%"
            
            
            
            
            
            
            
        }
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

