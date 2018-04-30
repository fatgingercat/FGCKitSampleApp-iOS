Pod::Spec.new do |s|
	s.name              = 'FGCKit'
	s.version           = '1.0.6'
	s.summary           = 'Awsome SDK for Manga consumption.'
	s.homepage          = 'https://www.fatginger.cat'

	s.author            = { 'Name' => 'support@fatginger.cat' }
	s.license           = { :type => 'MIT', :file => 'LICENSE' }

	s.platform          = :ios
	s.source            = { :http => "https://github.com/fatgingercat/FGCKitSampleApp.git" :tag => '1.0.6' }

	s.ios.deployment_target = '9.0'
	s.vendored_frameworks = 'FGCKit.framework'
end
