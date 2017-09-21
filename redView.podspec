Pod::Spec.new do |s|
  s.name         = "redView"
  s.version      = '1.0.0'
  s.summary      = 'An easy way to use pull-to-refresh'
  s.description  = <<-DESC
			组件化测试An easy way to use pull-to-refresh
                   DESC
  s.homepage     = "https://github.com/LeonLee1993/demo4”
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = {'niolgowoma1993.' => '592979364@qq.com'}
  s.platform     = :ios, '8.1'
  s.source       = {:git => "https://github.com/LeonLee1993/demo4.git", :tag => s.version}
  s.source_files  = "redPacketView/**/*.{h,m}"
  s.requires_arc = true
  s.resources = 'redPacketView/**/*.xib'



end