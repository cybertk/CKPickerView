Pod::Spec.new do |s|
  s.name             = "CKPickerView"
  s.version          = "0.1.0"
  s.summary          = "A short description"
  s.description      = <<-DESC
                       a longer description
                       DESC

  s.homepage         = "https://github.com/cybertk/CKPickerView"
  s.license          = "MIT"
  s.author           = "CKPickerView Contributors"
  s.source           = { :git => "https://github.com/cybertk/CKPickerView.git", :tag => "v#{s.version}" }

  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source_files = "CKPickerView/**/*.{swift,h,m,mm}"
end
