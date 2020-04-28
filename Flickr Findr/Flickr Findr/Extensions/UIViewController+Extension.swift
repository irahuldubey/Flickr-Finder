//
//  UIViewController+Extension.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation
import UIKit

/// Activity Indicator Protocol to show the ActivityIndicator
public protocol ActivityIndicatorProtocol {
  
  /// Instance of activity indicator
  var activityIndicator: UIActivityIndicatorView { get }
  
  /// Show the Loading Indicator in the view presented
  func showLoadingIndicator(withSize size: CGSize)
  
  /// Remove the loading Indicator from the view
  func removeLoadingIndicator()
}

//Apply the protocol to UIViewController in default conformance
public extension ActivityIndicatorProtocol where Self: UIViewController {
  
  /// Show the Loading Indicator
  func showLoadingIndicator(withSize size: CGSize) {
    //Create instance of activity Indicator on main queue, UIKit update should be on main queue
    DispatchQueue.main.async {
      self.activityIndicator.style = .whiteLarge
      self.activityIndicator.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
      self.activityIndicator.center = self.view.center
      self.activityIndicator.layer.cornerRadius = 6
      self.activityIndicator.color = .black
      self.activityIndicator.hidesWhenStopped = true
      self.activityIndicator.backgroundColor = .lightGray
      self.view.addSubview(self.activityIndicator)
      self.activityIndicator.startAnimating()
    }
  }
  
  /// Remove the Loading Indicator
  func removeLoadingIndicator() {
    DispatchQueue.main.async {
      ///Stop animating the activity indicator
      self.activityIndicator.stopAnimating()
      ///Remove the activity indicator once its stops animating
      self.activityIndicator.removeFromSuperview()
    }
  }
}

public extension ActivityIndicatorProtocol {
  var activityIndicator: UIActivityIndicatorView {
      return UIActivityIndicatorView()
  }
}
