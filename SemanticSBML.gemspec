Gem::Specification.new do |s|
  s.name        = 'SemanticSBML'
  s.version     = '0.0.1'
  s.date        = '2014-01-11'
  s.summary     = "A interface to work with the SemanticSBML REST API!"
  s.description = %q{SemanticSBML is an application to annotate stoichiometric models. This gem has the purpose to consult the REST API of this application to support the further work of bioinformaticians. }
  s.authors     = ["Steven Stadler"]
  s.email       = 'steven.stadler@gmail.com'
  s.files       = ["lib/SemanticSBML.rb"]
  s.homepage    = 'http://www.joermungandr.com'
  s.license     = 'MIT'
  
  s.add_dependency('typhoeus', ['~> 0.6', '>= 0.6.7'])
  s.add_dependency('json', ['~> 1.8', '>= 1.8.1'])
end
