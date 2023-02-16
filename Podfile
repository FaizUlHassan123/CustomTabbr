# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CustomTabbr' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CustomTabbr
  pod "VisualEffectView"
  pod 'IQKeyboardManagerSwift', '6.5.0'
  pod 'IQDropDownTextField'
#  pod 'ReachabilitySwift', '4.3.0'
#  pod 'KTCenterFlowLayout'
  pod 'SDWebImage'
#  pod 'Birdsong',  :git => 'https://github.com/dhrebeniuk/Birdsong.git', :branch => 'fixes'
#  pod 'CropViewController', '2.5.2'
  #pod 'GooglePlaces', '~> 3.4.0'
#  pod 'GooglePlaces'

#  pod 'HaishinKit', '~> 0.11.8'
#  pod 'ReverseExtension', :git => 'https://github.com/markusfi/ReverseExtension.git', :commit => 'ded09a8c054e'
#  pod 'Anchorage', '4.3'
  pod 'VisualEffectView', '3.1.0'
  pod 'HCSStarRatingView', '~> 1.5'
  pod 'BezierCurveView'
  pod 'MarqueeLabel', '3.2.0'
  pod 'SwiftLinkPreview'
  # pod 'NotificationBannerSwift'
  pod 'Alamofire', '<= 4.9'
  pod 'AlamofireImage'
#  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '4.3.1'
#  pod 'WCLShineButton'
#  pod 'Fabric', '~> 1.10.2'
#  pod 'Crashlytics', '~> 3.14.0'
#  pod 'Firebase/Analytics'
  pod 'SimpleAnimation'
#  pod 'CSV.swift'
  pod 'FloatingPanel', '~> 1.7.6'
  pod 'NVActivityIndicatorView/Extended'
  pod 'Branch'
#  pod 'FacebookCore'
#  pod 'FacebookShare'
#  pod 'SnapSDK'
  pod 'SKPhotoBrowser'
  pod 'YPImagePicker'
  pod 'SwiftSoup'
#  pod 'AgoraRtcEngine_iOS'
#  pod 'Flurry-iOS-SDK/FlurrySDK'
#  pod 'UXCam'
#  pod 'SnapKit', '~> 5.0.0'
  pod 'MBProgressHUD', '~> 1.2.0'
#  pod "SwiftRangeSlider"
  pod 'RSKPlaceholderTextView'
  
  target 'CustomTabbrTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CustomTabbrUITests' do
    # Pods for testing
  end

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end
