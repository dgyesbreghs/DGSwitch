#
# Be sure to run `pod lib lint DGViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DGSwitch'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DGSwitch.'
  s.description      = 'Hello World'

  s.homepage         = 'https://github.com/dgyesbreghs/DGSwitch'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dylan Gyesbreghs' => 'dgyesbreghs@gmail.com' }
  s.source           = { :git => 'https://github.com/dgyesbreghs/DGSwitch.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dgyesbreghs'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*'
  
  s.frameworks = 'UIKit'

  s.dependency 'PureLayout'
end
