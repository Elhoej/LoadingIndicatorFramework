//
//  LoadingIndicatorView.swift
//  LoadingIndicator
//
//  Created by Simon Elhoej Steinmejer on 19/09/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

public class LoadingIndicatorViewController: UIViewController, URLSessionDownloadDelegate
{
    //MARK: - Customization properties
    public var shouldPulseWhenFinished: Bool = true
    public var downloadUrlString = "http://mirrors.standaloneinstaller.com/video-sample/jellyfish-25-mbps-hd-hevc.3gp"
    
    
    internal lazy var loadingView: LoadingIndicatorView =
    {
        let loadingView = LoadingIndicatorView(frame: CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height))
        
        return loadingView
    }()
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(loadingView)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(beginDownload)))
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL)
    {
        print("finished")

        if shouldPulseWhenFinished
        {
            DispatchQueue.main.async {
                self.loadingView.animatePulsatingLayer()
            }
        }
    }

    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
    {
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        print(percentage)
        DispatchQueue.main.async {
            self.loadingView.percentageLabel.text = "\(Int(percentage * 100))%"
            self.loadingView.shapeLayer.strokeEnd = percentage
        }
    }
    
    @objc func beginDownload()
    {
        loadingView.shapeLayer.strokeEnd = 0
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: downloadUrlString) else { return }
        
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    
}



























