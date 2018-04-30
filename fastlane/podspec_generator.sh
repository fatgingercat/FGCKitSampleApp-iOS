#!/bin/bash

version=$1
echo "version = $version"
if [[ $version == "" ]]
then
echo "No version specified"
exit 1
fi

# cd ..
# version='1.0.30'
cat >../FGCKit.podspec <<EOL
Pod::Spec.new do |s|
	s.name              = 'FGCKit'
	s.version           = '$version'
	s.summary           = 'Awsome SDK for Manga consumption.'
	s.homepage          = 'https://www.fatginger.cat'

	s.author            = { 'Name' => 'support@fatginger.cat' }
	s.license           = { :type => 'MIT', :file => 'LICENSE' }

	s.platform          = :ios
	s.source            = { :http => "https://github.com/fatgingercat/FGCKitSampleApp.git" :tag => '$version' }

	s.ios.deployment_target = '9.0'
	s.vendored_frameworks = 'FGCKit.framework'
end
EOL
