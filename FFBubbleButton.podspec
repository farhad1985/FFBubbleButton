Pod::Spec.new do |s|
  s.name             = 'FFBubbleButton'
  s.version          = '0.1.3'
  s.summary          = 'FFBubbleButton is a Custom Button. by : farhad faramarzi'

 
  s.homepage         = 'https://github.com/farhad1985/FFBubbleButton'
  s.author           = { 'Farhad Faramarzi' => 'farhad.public@gmail.com' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/farhad1985/FFBubbleButton.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'FFBubbleButton/*'
 
end
