#
# Be sure to run `pod lib lint AbTrackingLib.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AbTrackingLib"
  s.version          = "1.0.6"
  s.summary          = "Library to track the open event to abtrckr.com"
  s.description      = <<-DESC
                       The library helps other projects to track the open app event to abtrckr.com
                       DESC
  s.homepage         = "https://github.com/Advertile/AbTrackingLib"
  s.license          = 'MIT'
  s.author           = { "Laura Orán" => "laura.oran@navilo.es" }
  s.source           = { :git => "https://github.com/Advertile/AbTrackingLib.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
#s.resource_bundles = {
#   'AbTrackingLib' => ['Pod/Assets/*.png']
#  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
