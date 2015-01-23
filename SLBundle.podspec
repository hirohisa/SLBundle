Pod::Spec.new do |s|

  s.name         = "SLBundle"
  s.version      = "0.0.1"
  s.summary      = "SLBundle provides to specify a standard language"

  s.description  = <<-DESC
SLBundle provides to specify a standard language for iOS.

First or second primary language is English in iOS's localization. If you change primary language, SLBundle can do.
                   DESC

  s.homepage     = "https://github.com/hirohisa/SLBundle"
  s.license      =  {
                      :type => "MIT",
                      :file => "LICENSE"
                    }
  s.author       =  { "Hirohisa Kawasaki" => "hirohisa.kawasaki@gmail.com" }
  s.source       =  {
                      :git => "https://github.com/hirohisa/SLBundle.git",
                      :tag => "0.0.1"
                    }

  s.source_files = "SLBundle"
  s.requires_arc = true

end
