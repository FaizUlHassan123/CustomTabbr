//
//  ViewController.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 30/01/2023.
//

import UIKit

//class ViewController: UIViewController {
//    
//    //MARK: - Properties
//    
//    var vc1:VC1!
//    var vc2:VC2!
//    var vc3:VC3!
//    var vc4:VC4!
//    var viewControllers: [UIViewController]!
//    
//    var selectedIndex: Int = 0
//    var previousIndex : Int = -1
//    
//    //MARK: - IBOutlets
//    @IBOutlet weak var contentView:UIView!
//    @IBOutlet var btnBottomMenu: [UIButton]!
//    @IBOutlet weak var btnMenu: UIButton!
//    @IBOutlet var lblBottomline: [UILabel]!
//    //MARK: - View Controller Life Cycle
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        setLayout()
//        setLocaization()
//        setUpBindings()
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//    }
//    
//    //MARK: - Custom Methods
//    
//    private func setLayout(){
//        vc1 = self.getViewController(withViewControllerStoryboardID: .VC1, andStoryboardName: .Main) as? VC1
//        vc2 = self.getViewController(withViewControllerStoryboardID: .VC2, andStoryboardName: .Main) as? VC2
//        vc3 = self.getViewController(withViewControllerStoryboardID: .VC3, andStoryboardName: .Main) as? VC3
//        vc4 = self.getViewController(withViewControllerStoryboardID: .VC4, andStoryboardName: .Main) as? VC4
//        viewControllers = [vc1,vc2,vc3,vc4]
//        
//        vc1 = self.getViewController(withViewControllerStoryboardID: .VC1, andStoryboardName: .Main) as? VC1
////        HomeViewController.containerDelegate = self
//        let objNavigationcontrollerHome = UINavigationController()
//        objNavigationcontrollerHome.viewControllers = [vc1]
//        
//        vc2 = self.getViewController(withViewControllerStoryboardID: .VC2, andStoryboardName: .Main) as? VC2
//        let objNavigationcontrollerFriend = UINavigationController()
//        objNavigationcontrollerFriend.viewControllers = [vc2]
//        
//        vc3 = self.getViewController(withViewControllerStoryboardID: .VC3, andStoryboardName: .Main) as? VC3
//        let objNavigationcontrollerChat = UINavigationController()
//        objNavigationcontrollerChat.viewControllers = [vc3]
//        
//        vc4 = self.getViewController(withViewControllerStoryboardID: .VC4, andStoryboardName: .Main) as? VC4
//        let objNavigationcontrollerSettings = UINavigationController()
//        objNavigationcontrollerSettings.viewControllers = [vc4]
//        
//        
//        viewControllers = [objNavigationcontrollerHome,objNavigationcontrollerFriend,objNavigationcontrollerChat,objNavigationcontrollerSettings]
//        registerXib()
//        //MARK:: Set ViewController in Containerview
//        addSelectedOptionControllerToView()
//    }
//    
//    //MARK:: Add Selected Controller To View
//    
//    func addSelectedOptionControllerToView() {
//        
////        btnBottomMenu[selectedIndex].isSelected = true
////        lblBottomMenu[selectedIndex].textColor = Color.BaseColor.value
////        lblBottomline[selectedIndex].backgroundColor = Color.BaseColor.value
////        lblBottomline[selectedIndex].cornerRadius = lblBottomline[selectedIndex].height / 2
//        
////        UIView.animate(withDuration: 0.3, animations: {() -> Void in
////
////
////            self.lblBottomline[self.selectedIndex].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
////        }, completion: {(_ finished: Bool) -> Void in
////            UIView.animate(withDuration: 0.3) {
////                self.lblBottomline[self.selectedIndex].transform = CGAffineTransform.identity
////            }
////        })
//        
//        let currentViewController = viewControllers[selectedIndex]
//        addChild(currentViewController)
//        let removeSpace = CGFloat(selectedIndex == 0 ? 0 : HOMESCREEN_COTAINER_EXTRA_BOTTOM_SPACE)
//        
//        currentViewController.view.frame = CGRect(x: contentView.bounds.origin.x, y: contentView.bounds.origin.y, width: contentView.bounds.width, height: contentView.bounds.height - removeSpace)
//        
//        contentView.backgroundColor = selectedIndex == 3 ? UIColor(displayP3Red: 240.0/255.0, green: 240.0/255.0, blue: 245.0/255.0, alpha: 1.0) : UIColor.white
//        contentView.addSubview(currentViewController.view)
//        currentViewController.didMove(toParent: self)
//    }
//    func removePreviuoslyAddedView() {
//        
//        let previousViewController = viewControllers[previousIndex]
//        previousViewController.willMove(toParent: nil)
//        previousViewController.view.removeFromSuperview()
//        previousViewController.removeFromParent()
//    }
//    
//    private func setLocaization(){
//        
//    }
//    
//    private func setUpBindings(){
//        
//    }
//    
//    private func registerXib(){
//        
//    }
//    
//    
//    //MARK: - IBactions
////    @IBAction func btnMenuBarClick(_ sender: UIButton) {
////        if(self.btnMenu.isSelected){
////            self.menuCenterViewController.view.removeFromSuperview()
////            self.menuCenterViewController.removeFromParent()
////            self.btnCenterButtonClicked(self.btnMenu)
////
////        }
////        Variables.shared.selectedBottomMenuTag = sender.tag - 1
////        //        if Variables.shared.selectedBottomMenuTag == 1{
////        //            let dic = ["peopleNearBySelected": false]
////        //            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(15)) { () -> () in
////        //                NotificationCenter.default.post(name: .peopleNearBySelected, object: nil,userInfo: dic)
////        //            }
////        //        }
////        refreshMenuSelection()
////    }
//    
//    @IBAction func didSelectTabBtn(_ sender : UIButton){
//        if(self.btnMenu.isSelected){
//            self.menuCenterViewController.view.removeFromSuperview()
//            self.menuCenterViewController.removeFromParent()
//            self.btnCenterButtonClicked(self.btnMenu)
//
//        }
//        Variables.shared.selectedBottomMenuTag = sender.tag - 1
//        //        if Variables.shared.selectedBottomMenuTag == 1{
//        //            let dic = ["peopleNearBySelected": false]
//        //            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(15)) { () -> () in
//        //                NotificationCenter.default.post(name: .peopleNearBySelected, object: nil,userInfo: dic)
//        //            }
//        //        }
//        refreshMenuSelection()
//        
//    }
//    
//    @objc func refreshMenuSelection() {
//        previousIndex = selectedIndex
//        btnBottomMenu[previousIndex].isSelected = false
//        lblBottomMenu[previousIndex].textColor = UIColor(named: "menu_unselect_color")!
//        lblBottomline[previousIndex].backgroundColor = UIColor.clear
//        selectedIndex = Variables.shared.selectedBottomMenuTag
//        if(previousIndex != selectedIndex){
//            transitionAnimation(view: btnBottomMenu[selectedIndex], animationOptions: previousIndex > selectedIndex ? .transitionFlipFromRight : .transitionFlipFromLeft, isReset: true)
//        }
//
//        removePreviuoslyAddedView()
//        addSelectedOptionControllerToView()
//    }
//    
//    
//}

