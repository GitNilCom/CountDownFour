
Pod::Spec.new do |s|
s.name         = 'CETimeCountDown'
s.version      = '1.0.2'
s.summary      = '一个已封装，简单易用的倒计时'
s.homepage     = 'https://github.com/04zhujunjie/CETimeCountDown'
s.license      = 'MIT'
s.authors      = {'CE' => 'xswt04CE@163.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/04zhujunjie/CETimeCountDown.git', :tag => s.version}
s.source_files = 'CETimeCountDown/*.{h,m}'
s.public_header_files = 'CETimeCountDown/*.h'
s.requires_arc = true
end
