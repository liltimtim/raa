# Uncomment this line to define a global platform for your project
 platform :ios, '9.0'

def import_pods
   pod 'Parse'
   pod 'ParseLiveQuery', :git => 'https://github.com/ParsePlatform/ParseLiveQuery-iOS-OSX.git'
   pod 'FBSDKCoreKit'
   pod 'FBSDKLoginKit'
   pod 'FBSDKCoreKit'
   pod 'ParseFacebookUtilsV4'
end

target 'RAA' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  import_pods
  # Pods for RAA

  target 'RAATests' do
    inherit! :search_paths
    # Pods for testing
    import_pods
  end

  target 'RAAUITests' do
    inherit! :search_paths
    # Pods for testing
    import_pods
  end

end
