#
# Be sure to run `pod lib lint JHDiamondSquare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JHDiamondSquare'
  s.version          = '0.1.0'
  s.summary          = 'An iterative Objective-C implementation of the diamond square algorithm.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An iterative Objective-C implementation of the diamond square algorithm. This technique is useful for generating tessellated 2D height maps to be used in modeling a cloudy sky, smokey air, or terrain.
                       DESC

  s.homepage         = 'https://github.com/JaredHalpern/JHDiamondSquare'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jared Halpern' => 'jareeedo@gmail.com' }
  s.source           = { :git => 'https://github.com/JaredHalpern/JHDiamondSquare.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/jaredehalpern'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JHDiamondSquare/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JHDiamondSquare' => ['JHDiamondSquare/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
