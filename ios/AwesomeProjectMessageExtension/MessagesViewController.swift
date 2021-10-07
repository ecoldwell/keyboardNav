//
//  MessagesViewController.swift
//  AwesomeProjectMessageExtension
//

import UIKit
import Messages


class MessagesViewController: MSMessagesAppViewController {

  override func willBecomeActive(with conversation: MSConversation) {
    self.presentReactNativeView()
  }
  
  private func presentReactNativeView() {
    self.removeAllChildViewControllers()
    
    let bundleURL = RCTBundleURLProvider
      .sharedSettings()?
      .jsBundleURL(forBundleRoot: "index.message", fallbackResource: nil)
    
    let rootView = RCTRootView(
      bundleURL: bundleURL,
      moduleName: "AwesomeProjectMessageExtension",
      initialProperties: nil,
      launchOptions: nil
    )
    
    let rootViewController = UIViewController()
    rootViewController.view = rootView
    
    self.addChild(rootViewController)
    rootViewController.view.frame = self.view.bounds
    rootViewController.view.translatesAutoresizingMaskIntoConstraints = false
    
    self.view.addSubview(rootViewController.view)
    
    NSLayoutConstraint.activate([
      rootViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      rootViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      rootViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
      rootViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
    
    self.didMove(toParent: self)
  }
}
