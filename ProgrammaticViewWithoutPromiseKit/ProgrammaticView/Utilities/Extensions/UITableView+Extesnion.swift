//
//  UITableView+Extesnion.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func confirm(to delegate: UITableViewDelegate, and dataSource: UITableViewDataSource) {
        
        // Confirm Delegate and DataSource
        self.delegate = delegate
        self.dataSource = dataSource
        
        // Configure table
        self.separatorStyle = .none
        self.separatorColor = .clear
        self.tableFooterView = UIView(frame: .zero)
        self.backgroundColor = .clear
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
}
