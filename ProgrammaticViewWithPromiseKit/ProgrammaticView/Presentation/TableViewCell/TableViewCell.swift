//
//  TableViewCell.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "TableViewCell"
    
    // MARK: - Identifier
    let cellLabel: UILabel = {
        let label = UILabel()
        if let font = UIFont(name: Utilities.Avenir.Medium, size: 18) {
            label.font = font
        }
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberLbl: UILabel = {
        let label = UILabel()
        if let font = UIFont(name: Utilities.Avenir.Medium, size: 25) {
            label.font = font
        }
        label.textAlignment = .center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "10"
        return label
    }()
    
    let image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "stars")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .medium
        indicator.color = .black
        return indicator
    }()
    
    // MARK: - View Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Functions
    fileprivate func setupConstraints() {
        addSubview(cellLabel)
//        addSubview(activityIndicator)
        
        
//        image.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
//        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        image.frame = CGRect(x: 0, y: 5, width: 150, height: 40)
        addSubview(image)
        numberLbl.frame = image.frame
        addSubview(numberLbl)
        
        cellLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        cellLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

//        activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
//        activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
//        activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
//        activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5).isActive = true
        
        activityIndicator.superview?.bringSubviewToFront(activityIndicator)
    }
    
    func updateAppearanceFor(_ name: String?) {
        DispatchQueue.main.async { [unowned self] in
            self.displayPreview(name)
        }
    }
    
    private func displayPreview(_ name: String?) {
        if let name = name {
            UIView.animate(withDuration: 0.3, animations: {
                self.cellLabel.text = name
            })
            activityIndicator.stopAnimating()
        }else{
            activityIndicator.startAnimating()
            cellLabel.text = ""
        }
    }
}
