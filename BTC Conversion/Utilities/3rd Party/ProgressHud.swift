//
//  ProgressHud.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD


class ProgressHud: MBProgressHUD {
    
    fileprivate static let defaultDelay: TimeInterval = 3
    
    class func showHUDAddedTo(_ view: UIView) -> ProgressHud {
        return showAdded(to: view, animated: true)
    }
    
    class func hideHUDForView(_ view: UIView) -> Bool {
        return self.hide(for: view, animated: true)
    }
    
    func hide() {
        self.hide(animated: true)
    }
    
    class func showDimBackgroundHUDAddedTo(_ view: UIView, customView: UIView) -> ProgressHud {
        let hud = ProgressHud.showHUDAddedTo(view)
        
        // Set the custom view mode to show any view.
        hud.mode = .customView
        hud.label.text = ""
        hud.detailsLabel.text = ""
        hud.customView = customView
        
        hud.bezelView.color = UIColor.clear
        hud.bezelView.style = .solidColor
        
        hud.backgroundView.color = UIColor(white: 0.13, alpha: 0.9)
        hud.bezelView.style = .solidColor
        
        
        
        
        return hud
    }
    
    class func showHUDAddedTo(_ view: UIView, customView:UIView, forDelay delay: TimeInterval) -> ProgressHud {
        let hud = ProgressHud.showHUDAddedTo(view)
        
        // Set the custom view mode to show any view.
        hud.mode = .customView
        hud.label.text = ""
        hud.detailsLabel.text = ""
        hud.customView = customView
        hud.bezelView.layer.cornerRadius = 4.0
        hud.margin = 10.0
        hud.bezelView.color = UIColor(white: 0.25, alpha: 0.8)
        hud.bezelView.style = .solidColor
        hud.hide(animated: true, afterDelay: delay)
        return hud
        
    }
    
    
}
