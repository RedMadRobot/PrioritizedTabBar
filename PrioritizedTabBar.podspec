Pod::Spec.new do |s|
  s.name             = 'PrioritizedTabBar'
  s.version          = '1.0.0'
  s.summary          = 'Native iOS TabBar with prioritized layout'
  s.description      = <<-DESC
  📱 Native iOS TabBar with main tab items grouped right under your finger
                       DESC

  s.homepage         = 'https://github.com/RedMadRobot/PrioritizedTabBar'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Roman Churkin' => 'rc@redmadrobot.com' }
  s.source           = { :git => 'https://github.com/RedMadRobot/PrioritizedTabBar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/firmach'

  s.ios.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'PrioritizedTabBar/Classes/**/*'

end
