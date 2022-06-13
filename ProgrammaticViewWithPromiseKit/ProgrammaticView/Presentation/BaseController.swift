//
//  BaseController.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import UIKit

class BaseController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Variables
    
    // MARK: - Constant
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Configure View
        setupView()
        
        // Navigation
        setupNavigation()
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
    fileprivate func setupView() {
        view.backgroundColor = .white
    }
    
    fileprivate func setupNavigation() {
        
        // BgColor
        let bgColor = UIColor.black
        
        // Navigation Settings
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = bgColor
        appearance.shadowColor = bgColor
        
        if let font = UIFont(name: Utilities.Avenir.Medium, size: 18) {
            let titleAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font]
            appearance.titleTextAttributes = titleAttribute
        }
        
        // Set Navigation Appearance
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance  = appearance
        
        // Navigation Tint color configuration
        self.navigationController?.navigationBar.barTintColor = bgColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = bgColor
        self.navigationController?.navigationBar.backgroundColor = bgColor
        self.navigationItem.backBarButtonItem?.tintColor = .white
    }
}
