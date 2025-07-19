#
# Be sure to run `pod lib lint PPToolKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PPToolKit'
  s.version          = '0.1.6'
  s.summary          = 'Some tools for iOS project created by pp.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Garenge/PPToolKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pengpeng' => 'garenge@outlook.com' }
  s.source           = { :git => 'https://github.com/Garenge/PPToolKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  }
  
  s.user_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  }


  s.ios.deployment_target = '10.0'

  s.public_header_files = 'PPToolKit/Classes/**/*.h'
  
  s.default_subspecs = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'PPToolKit/Classes/**/*'
  end

  # s.resource_bundles = {
  #   'PPToolKit' => ['PPToolKit/Assets/*.png']
  # }

  s.subspec 'PDF' do |pdf|
    # pdf.source_files = 'PPToolKit/PDF/**/*' # 表示PDF要用的文件, 这里没有
    # pdf.dependency 'PPToolKit/Core'   # 👈 明确声明依赖 Core 模块, 如果写了就是, pod 'PPToolKit/PDF'的时候, 会自动pod core, 不写表示只pod pdf
    pdf.dependency 'LGPdf', '~> 0.1.3-alpha'
  end
  
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency "Masonry" # 写在外面, 这样都会pod
end
