Pod::Spec.new do |spec|

  spec.name         = "STModuleService.swift"
  spec.version      = "0.0.1"
  spec.summary      = "STComponentTools/STModuleService swift 版本扩展."
  spec.description      = <<-DESC
  STComponentTools/STModuleService swift 版本扩展， 用以支持swift.
  DESC

  spec.homepage         = 'https://github.com/STTechnology5652/STModuleService.swift'
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "stephenchen" => "stephen5652@126.com" }
  spec.ios.deployment_target = '9.0'

  spec.source       = { :git => "https://github.com/STTechnology5652/STModuleService.swift.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files = 'STModuleService.swift/{Public,Private}/**/*.{h,m,mm,c,cpp,swift}'
  spec.module_name = "STModuleServiceSwift"

  # spec.exclude_files = "STModuleService.swift/Exclude" #排除文件

  spec.project_header_files = 'STModuleService.swift/Private/**/*.{h}'
  spec.public_header_files = 'STModuleService.swift/Public/**/*.h' #此处放置组件的对外暴漏的头文件

  # ――― binary framework/lib ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #spec.vendored_frameworks = 'STModuleService.swift/Private/**/*.framework'
  #spec.vendored_libraries = 'STModuleService.swift/Private/**/*.a'

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # 放置 json,font,jpg,png等资源
  #  spec.resources = ["STModuleService.swift/{Public,Private}/**/*.{xib}"]
  #  spec.resource_bundles = {
  #    'STModuleService.swift' => ['STModuleService.swift/Assets/*.xcassets', "STModuleService.swift/{Public,Private}/**/*.{png,jpg,font,json}"]
  #  }


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"
  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  # 其他依赖pod
  spec.dependency "STComponentTools/STModuleService"

#   spec.subspec 'WithLoad' do |ss|
#       ss.source_files = 'YKHawkeye/Src/MethodUseTime/**/*{.h,.m}'
#       ss.pod_target_xcconfig = {
#         'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) YKHawkeyeWithLoad'
#       }
#       ss.dependency 'YKHawkeye/Core'
#       ss.vendored_frameworks = 'YKHawkeye/Framework/*.framework'
#     end

end
