#
# Be sure to run `pod lib lint AFZalandoSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AFZalandoSDK"
  s.version          = "0.1.0"
  s.summary          = "iOS SDK for Zalando public API"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  

  s.homepage         = "https://github.com/alexfedosov/AFZalandoSDK"
  s.license          = 'MIT'
  s.author           = { "Alexander Fedosov" => "alexander.a.fedosov@gmail.com" }
  s.source           = { :git => "https://github.com/alexfedosov/AFZalandoSDK.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexfedosov'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AFZalandoSDK' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.6.3'
end
