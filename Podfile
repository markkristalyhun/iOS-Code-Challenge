platform :ios, '12.0'

target 'Code_Challenge' do
  use_frameworks!
  inhibit_all_warnings!

  pod 'Bond', '= 7.8.1'
  pod 'Swinject', '= 2.8.3'

  target 'Code_ChallengeTests' do
    inherit! :search_paths

    pod 'Quick', '= 4.0.0'
    pod 'Nimble', '= 9.2.1'
  end
end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
            end
        end
    end
end
