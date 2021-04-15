Gem::Specification.new do |s|
  s.name        = 'ethereum-contract-abi'
  s.version     = '0.1.0'
  s.summary     = "Ethereum contract ABI encoder and decoder"
  s.description = "A library for interacting with Ethereum smart contracts via the Contract Application Binary Interface (ABI)"
  s.authors     = ["Evan Taylor"]
  s.email       = 'evan@evantaylor.ca'
  s.homepage    = "https://evantaylor.ca"
  s.license     = 'MIT'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  s.require_paths = ["lib"]
end