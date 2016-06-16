#
# Be sure to run `pod lib lint JKKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name         = "ObjectMapperTransforms"
  s.version      = "1.0.0"
  s.summary      = "ObjectMapperTransforms - Any To Any Transform"
  s.homepage     = "http://futao.me/"
  s.license      = "Apache License, Version 2.0"
  s.author       = "Futao"
  s.requires_arc = true
  s.source       = {:git => 'https://github.com/Ftkey/ObjectMapperTransforms.git', :tag => s.version.to_s }

  s.frameworks  = "Foundation"
  s.source_files = 'Sources/**/*.{swift}'
  s.dependency 'ObjectMapper'

end


