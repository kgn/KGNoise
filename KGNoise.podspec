Pod::Spec.new do |s|
  s.name         = 'KGNoise'
  s.version      = '1.2.0'
  s.summary      = 'Cocoa noise drawing code + a ready to go noise view!'
  s.homepage     = 'https://github.com/kgn/KGNoise'
  s.license      = 'MIT'
  s.requires_arc = true
  s.author = {
    'David Keegan' => 'git@davidkeegan.com'
  }
  s.source = {
    :git => 'https://github.com/kgn/KGNoise.git',
    :tag => '1.2.0'
  }
  s.source_files = '*.{h,m}'
end
