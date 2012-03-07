require 'rb-readline'

guard 'bundler' do
  watch('Gemfile')
end

guard 'rspec', version: 2, cli: '--format Fuubar --colour' do
  watch(%r{^.+((?<!spec)\.rb)$}) { "spec" }
  watch(%r{^spec/.+_spec\.rb})
end
