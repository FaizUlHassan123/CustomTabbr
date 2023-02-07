//
//  ContaineRViewController.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 31/01/2023.
//

enum PopupButton: Int {
    case Dropchat   = 1
    case Post   =  2
    case Live     = 3
}


import UIKit


class ContainerViewController: UIViewController {
    
    //MARK::
    //MARK:: IB Outlets
    
    @IBOutlet weak var viewBlur: VisualEffectView!//UIView!
    
    @IBOutlet var btnPopup: [UIButton]!
    @IBOutlet weak var viewBottombar: UIView!
    @IBOutlet var lblBottomline: [UILabel]!
    @IBOutlet var btnBottomMenu: [UIButton]!
    @IBOutlet weak var btnFriends: SSBadgeButton!
    @IBOutlet weak var btnChats: SSBadgeButton!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnAccount: UIButton!


    
    @IBOutlet var lblBottomMenu: [UILabel]!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeBarBtn: UIView!

    
    // Tutorial
    @IBOutlet weak var vwTutorialOverlay: UIView!
    @IBOutlet weak var vwBottomBarOverlay: UIView!
    @IBOutlet weak var vwTopBarOverlay: UIView!
    @IBOutlet weak var vwTapBarOverlay: UIView!
    @IBOutlet weak var vwFriendBarOverlay: UIView!

    
    @IBOutlet weak var lblCreateTutorialText: UILabel!
    @IBOutlet weak var vwCreateArrow: UIView!
    @IBOutlet weak var vwFrndCreateArrow: UIView!

    @IBOutlet weak var btnCreateOverlay: UIButton!
    @IBOutlet weak var imgVwDropchatTutorial: UIImageView!
    @IBOutlet weak var imgVwPostTutorial: UIImageView!
    @IBOutlet weak var imgVwLivestreamTutorial: UIImageView!

    @IBOutlet weak var imgVwArrow1: UIImageView!
    @IBOutlet weak var imgVwArrow2: UIImageView!
    @IBOutlet weak var imgVwArrow3: UIImageView!

    @IBOutlet weak var imgFrndVwArrow1: UIImageView!
    @IBOutlet weak var imgFrndVwArrow2: UIImageView!
    @IBOutlet weak var imgFrndVwArrow3: UIImageView!

    @IBOutlet weak var bottomConstraintTutorialLabel: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraintTopBarOverlay: NSLayoutConstraint!
    
    @IBOutlet weak var btnExitTutorial: UIButton!
    
    @IBOutlet weak var bottomConstraintBlurView: NSLayoutConstraint!
    @IBOutlet weak var tabBarImage: UIImageView!


    
    var latituide = Float()
    var longitude = Float()
    var bottomViewLine = UIImageView()
    let requiredWidth = ((UIScreen.main.bounds.size.width) / 5)
    var boolPopup :  Bool = false

    
    var HomeViewController: VC1!
    var FriendsViewController : VC2!
    var ChatViewController: VC3!
    var SettingsViewController: VC4!
    var menuCenterViewController : MenuCenterViewController!

    var viewControllers: [UIViewController]!
    
    
    var selectedIndex: Int = 0
    var previousIndex : Int = -1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK:: Set ViewController in Containerview
        self.setIntialViewControllers()

        

        if let image = btnMenu.imageView {
            self.btnMenu.bringSubviewToFront(image)
        }

        //Load User image on botton Navigation buttoon
        let sideSize: CGFloat = 32

        let imgplaceholder = UIImage(named: "new_placholder_profile3")


        btnAccount.setImage(imgplaceholder , for: .normal)
        btnAccount.setImage(imgplaceholder , for: .selected)

    }

    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    //MARK::
    //MARK:: SetupUI
    
    func setupUI()  {
        
        self.btnMenu.cornerRadius = self.btnMenu.height / 2
        lblBottomMenu = lblBottomMenu.sorted(by: { $0.tag < $1.tag })
        btnBottomMenu = btnBottomMenu.sorted(by: { $0.tag < $1.tag })
        lblBottomline = lblBottomline.sorted(by: { $0.tag < $1.tag })

        addBlurEffect()
        
        //  viewBottombar.addShadow(to: [.top], radius:  2 , toColor: UIColor.lightGray)
        
        // Badge
        setFriendsTabBadge()
        setChatsTabBadge()
        
    }
    //MARK::

    @objc func closeFanMenu(){
    }
    //MARK::
    //MARK:: Opne TabMenu
    func popOvermenu()  {
        
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        //        UIApplication.shared.statusBarStyle = .default
        
//        invalidateArrowTimer()
    }
    
    //MARK:: Set All View Controller in containerview
    func setIntialViewControllers() {
        HomeViewController = self.getViewController(withViewControllerStoryboardID: .VC1, andStoryboardName: .Main) as? VC1
//        HomeViewController.containerDelegate = self
        let objNavigationcontrollerHome = UINavigationController()
        objNavigationcontrollerHome.viewControllers = [HomeViewController]
        
        FriendsViewController = self.getViewController(withViewControllerStoryboardID: .VC2, andStoryboardName: .Main) as? VC2
        let objNavigationcontrollerFriend = UINavigationController()
        objNavigationcontrollerFriend.viewControllers = [FriendsViewController]
        
        ChatViewController = self.getViewController(withViewControllerStoryboardID: .VC3, andStoryboardName: .Main) as? VC3
        let objNavigationcontrollerChat = UINavigationController()
        objNavigationcontrollerChat.viewControllers = [ChatViewController]
        
        SettingsViewController = self.getViewController(withViewControllerStoryboardID: .VC4, andStoryboardName: .Main) as? VC4
//        SettingsViewController.user = Utilities.getUserProfile()
//        SettingsViewController.isHideBackButton = true

        let objNavigationcontrollerSettings = UINavigationController()
        objNavigationcontrollerSettings.viewControllers = [SettingsViewController]
        
        
        viewControllers = [objNavigationcontrollerHome,objNavigationcontrollerFriend,objNavigationcontrollerChat,objNavigationcontrollerSettings]
        
        addSelectedOptionControllerToView()
        
    }
    
    
    //MARK::
    //MARK:: Add Selected Controller To View
    
    func addSelectedOptionControllerToView() {
        
        btnBottomMenu[selectedIndex].isSelected = true
        lblBottomMenu[selectedIndex].textColor = .white
        //        lblBottomline[selectedIndex].backgroundColor = Color.BaseColor.value
        //        lblBottomline[selectedIndex].cornerRadius = lblBottomline[selectedIndex].height / 2
        
        //        UIView.animate(withDuration: 0.3, animations: {() -> Void in
        //
        //
        //            self.lblBottomline[self.selectedIndex].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        //        }, completion: {(_ finished: Bool) -> Void in
        //            UIView.animate(withDuration: 0.3) {
        //                self.lblBottomline[self.selectedIndex].transform = CGAffineTransform.identity
        //            }
        //        })
        
        let currentViewController = viewControllers[selectedIndex]
        addChild(currentViewController)
        let removeSpace = CGFloat(selectedIndex == 0 ? 0 : HOMESCREEN_COTAINER_EXTRA_BOTTOM_SPACE)
        
        currentViewController.view.frame = CGRect(x: contentView.bounds.origin.x, y: contentView.bounds.origin.y, width: contentView.bounds.width, height: contentView.bounds.height - removeSpace)
        
        contentView.backgroundColor = selectedIndex == 3 ? UIColor(displayP3Red: 240.0/255.0, green: 240.0/255.0, blue: 245.0/255.0, alpha: 1.0) : UIColor.white
        contentView.addSubview(currentViewController.view)
        currentViewController.didMove(toParent: self)
    }
    func removePreviuoslyAddedView() {
        
        let previousViewController = viewControllers[previousIndex]
        previousViewController.willMove(toParent: nil)
        previousViewController.view.removeFromSuperview()
        previousViewController.removeFromParent()
    }


    

    
    
    @IBAction func btnMenuBarClick(_ sender: UIButton) {
        if(self.btnMenu.isSelected){
            self.menuCenterViewController.view.removeFromSuperview()
            self.menuCenterViewController.removeFromParent()
            self.btnCenterButtonClicked(self.btnMenu)

        }
//        Variables.shared.selectedBottomMenuTag = sender.tag - 1
        Variables.shared.selectedBottomMenuTag = sender.tag
        //        if Variables.shared.selectedBottomMenuTag == 1{
        //            let dic = ["peopleNearBySelected": false]
        //            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(15)) { () -> () in
        //                NotificationCenter.default.post(name: .peopleNearBySelected, object: nil,userInfo: dic)
        //            }
        //        }
        refreshMenuSelection()
    }
    
    @IBAction func btnCenterButtonClicked(_ sender: UIButton) {
        if(self.btnMenu.isSelected){
            self.btnMenu.isSelected = false
            self.menuCenterViewController.willMove(toParent: nil)
            self.menuCenterViewController.imgBgTransperant.isHidden = true
            UIView.animate(withDuration: 0.4,
                           animations: { [weak self] () -> Void in
                guard let `self` = self else { return }
                self.menuCenterViewController.constraintBtnChatLeading.constant =  ((ScreenSize.SCREEN_WIDTH / 2) - (self.menuCenterViewController.btnChat.width / 2))
                self.menuCenterViewController.constraintBtnDropTraling.constant =  ((ScreenSize.SCREEN_WIDTH / 2) - (self.menuCenterViewController.btnDrop.width / 2))
                self.menuCenterViewController.constraintBtnPostTop.constant =  self.menuCenterViewController.btnDrop.frame.origin.y
                self.view.layoutIfNeeded()

                UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.menuCenterViewController.view.frame = CGRect(x: self.contentView.bounds.origin.x, y:  ScreenSize.SCREEN_HEIGHT, width:  self.contentView.bounds.width, height:  self.contentView.bounds.height )
                    self.view.layoutIfNeeded()
                })
            },completion: { [weak self] (_ finished: Bool) -> Void in
                UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseInOut, animations: {
                    self!.menuCenterViewController.view.removeFromSuperview()
                    self!.menuCenterViewController.removeFromParent()

                })
            })
        }
        else{
            self.btnMenu.isSelected = true
            self.playClickEventSound(soundName: "homePlus", extensionName: "wav")
            self.menuCenterViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuCenterViewController") as? MenuCenterViewController
            self.menuCenterViewController.delegate = self
            addChild(menuCenterViewController)
            
            self.menuCenterViewController.view.frame = CGRect(x: self.contentView.bounds.origin.x, y:  ScreenSize.SCREEN_HEIGHT, width:  0, height:  0)
            
            self.contentView.addSubview(self.menuCenterViewController.view)
            self.menuCenterViewController.didMove(toParent: self)
            
            UIView.animate(withDuration: 0.5,
                           animations: { [weak self] () -> Void in
                guard let `self` = self else { return }
                self.menuCenterViewController.view.frame = CGRect(x: self.contentView.bounds.origin.x, y:  self.contentView.bounds.origin.y, width:  self.contentView.bounds.width, height:  self.contentView.bounds.height )
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.4, delay: 0.1, options: .curveEaseInOut, animations: {

                    //for button left constarint becacse hiddong other two button
                    let width = (self.menuCenterViewController.menuView.frame.size.width / 2) - 30
                    self.menuCenterViewController.constraintBtnChatLeading.constant =  width


                    //                                self.menuCenterViewController.constraintBtnChatLeading.constant =  30
                    self.menuCenterViewController.constraintBtnDropTraling.constant =  30
                    self.menuCenterViewController.constraintBtnPostTop.constant = 30

                    self.view.layoutIfNeeded()
                },completion: { [weak self] b in
//                    self?.menuCenterViewController.showTutorial()
                })
            }, completion:{ [weak self] (_ finished: Bool) -> Void in
                self!.menuCenterViewController.imgBgTransperant.isHidden = false

            })
        }
        
        let transform = self.btnMenu.isSelected
        ? CGAffineTransform(rotationAngle: CGFloat(Double.pi / 4)) : CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.4, animations: {
            self.btnMenu.transform = transform
        })
    }
    
    @objc func refreshMenuSelection() {
        previousIndex = selectedIndex
        btnBottomMenu[previousIndex].isSelected = false
        lblBottomMenu[previousIndex].textColor = UIColor(named: "menu_unselect_color")!
        lblBottomline[previousIndex].backgroundColor = UIColor.clear
        selectedIndex = Variables.shared.selectedBottomMenuTag
        if(previousIndex != selectedIndex){
            transitionAnimation(view: btnBottomMenu[selectedIndex], animationOptions: previousIndex > selectedIndex ? .transitionFlipFromRight : .transitionFlipFromLeft, isReset: true)
        }

        removePreviuoslyAddedView()
        addSelectedOptionControllerToView()
    }
    
    // MARK: - Set Badge
    
    func setFriendsTabBadge() {
        /*btnFriends.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 10)
         let badge = 4000
         btnFriends.badge = String(badge.abbreviated)*/
    }

    func transitionAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
        UIView.transition(with: view, duration: 0.8, options: animationOptions, animations: {
        }, completion: nil)
    }
    func curveAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
        let defaultXMovement: CGFloat = 240
        UIView.animate(withDuration: 0.8, delay: 0, options: animationOptions, animations: {
            view.transform = isReset ? .identity : CGAffineTransform.identity.translatedBy(x: defaultXMovement, y: 0)
        }, completion: nil)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == createTutorialSegue {
     let destinationViewController:CreateTutorialViewController = segue.destination as! CreateTutorialViewController
     destinationViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
     }
     }*/
    

}


extension ContainerViewController: MenuCenterViewControllerDelegate {
    func menuButtonPress(tag: Int) {
        if(self.btnMenu.isSelected){
            self.menuCenterViewController.view.removeFromSuperview()
            self.menuCenterViewController.removeFromParent()
            self.btnCenterButtonClicked(self.btnMenu)

        }
//        self.btnPopuptap(tag: tag)
    }
}

