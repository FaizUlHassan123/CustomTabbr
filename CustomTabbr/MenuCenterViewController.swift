//
//  File.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 31/01/2023.
//

import Foundation

import UIKit
protocol MenuCenterViewControllerDelegate: AnyObject {
    func menuButtonPress(tag: Int)
}

class MenuCenterViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var imgBgTransperant: UIImageView!
    @IBOutlet weak var btnChat: UIButton!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var btnDrop: UIButton!
    
    @IBOutlet weak var constraintBtnChatLeading: NSLayoutConstraint!
    @IBOutlet weak var constraintBtnPostTop: NSLayoutConstraint!
    @IBOutlet weak var constraintBtnDropTraling: NSLayoutConstraint!
    
    var delegate : MenuCenterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.constraintBtnChatLeading.constant =  ((ScreenSize.SCREEN_WIDTH / 2) - (btnChat.width / 2))
        self.constraintBtnDropTraling.constant =  ((ScreenSize.SCREEN_WIDTH / 2) - (btnDrop.width / 2))
        self.constraintBtnPostTop.constant =  self.btnDrop.frame.origin.y
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btnChat_Clicked(_ sender: UIButton) {
        if(delegate != nil){
            self.delegate?.menuButtonPress(tag: 1)
        }
    }
    @IBAction func btnPost_Clicked(_ sender: UIButton) {
        if(delegate != nil){
            self.delegate?.menuButtonPress(tag:2)
        }
    }
    @IBAction func btnDrop_Clicked(_ sender: UIButton) {
        if(delegate != nil){
            self.delegate?.menuButtonPress(tag:3)
        }
    }
    
    
}

//top buttons tutorial
extension MenuCenterViewController{
//    private func button(forTutorialType type: HomeTutorialType) -> UIButton? {
//        switch type {
//        case .popupPost:
//            return btnPost
//        case .popupDropchats:
//            return btnChat
//        case .showDropLive:
//            return btnDrop
//        default:
//            return nil
//        }
//    }

//    private func hintText(forButton btn: UIButton) -> String{
//        if btn === btnChat{
//            return kTutorialPopupDropchats
//        }
//        if btn === btnPost{
//            return kTutorialPopupPost
//        }
//        if btn === btnDrop{
//            return kTutorialPopupLivestream
//        }
//        return ""
//    }

//    func showTutorial(){
//        guard let type = HomeTutorialType(rawValue: Utilities.getHomeTutorialType()), let control = button(forTutorialType: type) else {
//            return
//        }
//        var firstTutorialCompletion : (UIView, Bool) -> Void = {hint, canceled in}
//        firstTutorialCompletion = { [weak self] hintControl, canceled in
//            guard canceled == false else {
//                Utilities.setHomeTutorialType(type: HomeTutorialType.popupLivestream)
//                self?.showTutorial()
//                return
//            }
//            switch Utilities.getHomeTutorialType() {
//            case HomeTutorialType.showDropLive.rawValue:
//                Utilities.setHomeTutorialType(type: HomeTutorialType.popupDropchats)
//            case HomeTutorialType.popupDropchats.rawValue:
//                Utilities.setHomeTutorialType(type: HomeTutorialType.popupPost)
//            case HomeTutorialType.popupPost.rawValue:
//                Utilities.setHomeTutorialType(type: HomeTutorialType.popupLivestream)
//            default:
//                break
//            }
//            self?.showTutorial()
//        }
//        let tutorialView = TutorialView()
//        tutorialView.hintPosition = .top
//        tutorialView.completionBlock = firstTutorialCompletion
//        tutorialView.show(forControl: control, withHintText: hintText(forButton: control), animated: false)
//    }
}
