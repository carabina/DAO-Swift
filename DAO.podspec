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
    :tag => "1.0.0"
  }

  s.ios.deployment_target = "8.0"
  s.source_files  = "Classes", "DAO/Classes/**/*.{swift}"
  # s.exclude_files = "Classes/Exclude"

  s.dependency "RealmSwift"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }


end
