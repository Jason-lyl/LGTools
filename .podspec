Pod::spec.new do |s|
  s.name          =  "Tools"
  s.version       =  "0.0.1"
  s.ios.deployment_target = '9.0'
  s.summary       =  "简介"
  s.homepage      =  "https://github.com/LiYuLong012"
  s.social_media_url:   = "https://github.com/LiYuLong012"
  s.license       = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author        = { "zyq" => "longge_li0123@163.com" }
  s.source        = { :git => 'https://github.com/LiYuLong012/Tools.git', :tag => s.version}
  s.requires_arc    = true
  s.source_files    = 'Tools/*'
