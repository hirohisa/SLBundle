Pod::Spec.new do |s|

  s.name         = "SLBundle"
  s.version      = "0.0.1"
  s.summary      = "SLBundle provides to specify a standard language"

  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://github.com/hirohisa/SLBundle"
  s.license      =  {
                      :type => "MIT",
                      :file => "LICENSE"
                    }
  s.author       =  { "Hirohisa Kawasaki" => "hirohisa.kawasaki@gmail.com" }
  s.source       =  {
                      :git => "http://github.com/hirohisa/SLBundle.git",
                      :tag => "0.0.1"
                    }

  s.source_files = "SLBundle"
  s.requires_arc = true

end
