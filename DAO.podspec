Pod::Spec.new do |s|

  s.name         = "DAO"
  s.version      = "1.0.0"
  s.summary      = "DataBase rules framework."

  s.description  = <<-DESC
  Database Architecture Orientated framework
                   DESC

  s.homepage = "http://itliving.ru/DAO"
  s.license      = "MIT"
  s.author       = { "IrishMan1921" => "drabberodin@gmail.com" }
  s.source       = 
  { 
    :git => "https://github.com/irishman1921/DAO-Swift.git", 
    :branch => "master", 
    :tag => "1.0.1"
  }

  s.ios.deployment_target = "8.0"
  s.source_files  = "Classes", "DAO/Classes/**/*.{swift}"

  s.dependency "RealmSwift"

end
