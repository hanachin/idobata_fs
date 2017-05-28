Gem::Specification.new do |s|
  s.name     = "idobata_fs"
  s.version  = "0.0.2"
  s.license  = "MIT"
  s.summary  = "mount your idobata rooms via FUSE"
  s.author   = "Seiei Miyagi"
  s.email    = "hanachin@gmail.com"
  s.homepage = "https://github.com/hanachin/idobata_fs"
  s.require_paths = ['.']
  s.files = %w(idobata_fs idobata_fs.rb)
  s.bindir = '.'
  s.executables << "idobata_fs"
  s.add_dependency "rfusefs", "~> 1.0", ">= 1.0.3"
  s.add_dependency "idobata_graph_ql", "~> 0.0", ">= 0.0.2"
end
