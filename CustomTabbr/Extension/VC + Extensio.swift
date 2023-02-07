//
//  VC + Extensio.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 30/01/2023.
//

import Foundation
import UIKit


extension UIViewController{
    
    func getViewController(withViewControllerStoryboardID viewControllerID:ViewControllersID , andStoryboardName storyboard:StoryboardName) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vc = (storyboard.instantiateViewController(withIdentifier: viewControllerID.rawValue)) as UIViewController
        return vc
    }
    
    
}
//MARK: - ViewController Storyboard Identifiers
enum ViewControllersID : String {
    case VC1 = "VC1"
    case VC2 = "VC2"
    case VC3 = "VC3"
    case VC4 = "VC4"

    
}
//MARK: - Storyboard Names
enum StoryboardName : String {
    case Main = "Main"

}
