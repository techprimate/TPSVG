Pod::Spec.new do |s|
  s.name             = "TPSVG"
  s.version          = "0.1.1"
  s.summary          = "TPSVG is a SVG parsing engine"
  s.description      = <<-DESC
TPSVG parses SVG vector-based graphics according to the SVG2 standard at https://www.w3.org/TR/SVG2/
                       DESC

  s.homepage         = "https://github.com/techprimate/TPSVG"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Philip Niedertscheider" => "phil@techprimate.com" }
  s.source           = { :git => "https://github.com/techprimate/TPSVG.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/techprimate"

  s.ios.deployment_target = "8.0"

  s.source_files = "Source/Classes/**/*"
  s.frameworks = "UIKit"

  s.dependency "SwiftLint"
end
