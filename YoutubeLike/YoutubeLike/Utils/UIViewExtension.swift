//
//  UIViewExtension.swift
//  YoutubeLike
//
//  Created by Azhman Adam on 8/20/23.
//

import UIKit

extension UIView {
    
    func addConstraintsWith(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func addConstraintsWith(formats: [String], forView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        formats.forEach { format in
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": view]))
        }
    }
    
}
