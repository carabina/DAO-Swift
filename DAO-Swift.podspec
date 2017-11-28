#
# Be sure to run `pod lib lint DAO-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DAO-Swift'
  s.version          = '1.1.1'
  s.summary          = 'Realization of pattern Data Access Object in Swift'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/irishman1921/DAO-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'irishman1921' => 'drabberodin@gmail.com' }
  s.source           = { :git => 'https://github.com/irishman1921/DAO-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DAO-Swift/Classes/**/*'

  s.dependency "RealmSwift"

end
