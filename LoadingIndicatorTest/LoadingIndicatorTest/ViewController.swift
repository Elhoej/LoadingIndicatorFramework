//
//  ViewController.swift
//  LoadingIndicatorTest
//
//  Created by Simon Elhoej Steinmejer on 19/09/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit
import LoadingIndicator

class ViewController: UIViewController
{
    
    let testUrlString = "http://mirrors.standaloneinstaller.com/video-sample/jellyfish-25-mbps-hd-hevc.3gp"
    
    let loadingIndicatorViewController: LoadingIndicatorViewController =
    {
        let livc = LoadingIndicatorViewController()
        livc.shouldPulseWhenFinished = true
        livc.downloadUrlString = "http://mirrors.standaloneinstaller.com/video-sample/jellyfish-25-mbps-hd-hevc.3gp"
        
        return livc
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        loadingIndicatorViewController.view.frame = self.view.frame
        view.addSubview(loadingIndicatorViewController.view)
        
    }


}

