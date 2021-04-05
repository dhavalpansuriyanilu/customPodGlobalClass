#
# Be sure to run `pod lib lint customPodGlobalClass.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'customPodGlobalClass'
  s.version          = '0.1.6'
  s.summary          = 'just write one line code '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'just write one line code'
                       DESC

  s.homepage         = 'https://github.com/dhavalpansuriyanilu/customPodGlobalClass'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dhavalpansuriyanilu' => 'dhavalpansuriya.nilu@gmail.com' }
  s.source           = { :git => 'https://github.com/dhavalpansuriyanilu/customPodGlobalClass.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = ' 10.0'
  s.swift_version = '5.0'
  s.platforms = {
  "ios": "10.0"
  }

  s.source_files = 'Classes/*.{h,m,swift,xib}'
 
  # s.resource_bundles = {
  #   'customPodGlobalClass' => ['customPodGlobalClass/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = 'UIKit'
  s.static_framework = true
  s.dependency 'FLAnimatedImage'
  s.dependency 'SwiftyStoreKit'
  s.dependency 'ReachabilitySwift'
  s.dependency 'SVProgressHUD'
  s.dependency 'Firebase/Analytics'
  s.dependency 'Firebase/Messaging'
  s.dependency 'Firebase/RemoteConfig'
  s.dependency 'FirebaseCrashlytics'
  s.dependency 'Siren'
  s.dependency 'FBAudienceNetwork' , '~> 6.2.1'
  s.dependency 'IronSourceSDK'
  
end
