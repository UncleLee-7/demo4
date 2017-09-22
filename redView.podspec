Pod::Spec.new do |s|
  s.name         = "redView"
  s.version      = '1.0.0'
  s.summary      = 'An easy way to use pull-to-refresh'
  s.homepage     = 'https://github.com/LeonLee1993/demo4'
  s.license      = 'MIT'
  s.author       = {'niolgowoma1993.' => '592979364@qq.com'}
  s.platform     = :ios, '10.3'
  s.source       = {:git => 'https://github.com/LeonLee1993/demo4.git', :tag => s.version}
  s.source_files  = 'redPacketView/**/*.{h,m}'
  s.requires_arc = true

end