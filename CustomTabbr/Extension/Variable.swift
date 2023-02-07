//
//  Variable.swift
//  CustomTabbr
//
//  Created by Faiz Ul Hassan on 31/01/2023.
//

import Foundation
import UIKit
import AVFoundation

// MARK: - Chat
var selectedBottomMenuTag = 0
let HOMESCREEN_COTAINER_EXTRA_BOTTOM_SPACE = 60
var kEmptyString = ""

class Variables {
    class var shared: Variables {
        struct Static {
            static let instance: Variables = Variables()
        }
        return Static.instance
    }
    
    // MARK: - Current session task
    var currentTask: URLSessionTask?
    
    // MARK: - Device Token
    var deviceToken: String = kEmptyString

    // MARK: - DropChat Token
    var dropChatColor: String = kEmptyString
    var isFromHome: Bool = false

    
    // MARK: - Chat
    var selectedBottomMenuTag = 0
    var isSwitchToChatConversation = false
    var isSwitchToCreateChat = false
    var isNavigatedBackToChatsList = false
    var isSwitchToSuggetedPeople = false
    var isDisconnectSocketManually = false
    var pushNotificationPayload: [String:Any]?
    var isPushNotiInActiveState: Bool = false
    var isOpenChatFromNotificationList: Bool = false
    var viewPrivatePostId:Int = 0
    var isPrivatePostShared:Bool = false
    var isPrivatePostSharedWithSomeone:Bool = false
    var userIdForSharingPost:Int?
    var reloadChatAfterSharingPost:Bool = false
    var notificationCount:Int = 0

    // MARK: - Interests
    

    
//    var arrLastOpenedLivestreams: [Livestream] = []
    
    var viewControllerAfterReportSubmitted:Any?
    var isReportingComment:Bool = false
    var isRedirectingMembersScreen:Bool = false
    var objNotificaions:Notifications?
    var player: AVAudioPlayer?
}

// MARK:- SCREEN SIZE
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
//Bhikhu Code
// MARK:- DEVICE TYPE
struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6_PLUS     = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad
}


extension UIViewController{
    func playClickEventSound(soundName: String, extensionName : String){
        DispatchQueue.main.async(execute: {() -> Void in
            guard let url = Bundle.main.url(forResource: soundName, withExtension: extensionName) else { return }


            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                Variables.shared.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

                guard let player = Variables.shared.player else { return }
                player.prepareToPlay()

                player.play()

            } catch let error {
//                printCustom(message:"\(error.localizedDescription)")
                print("Error \(error.localizedDescription)")
            }
        })
    }


}
