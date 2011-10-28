# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'yard' do
  watch(%r{app/.+\.rb})
  watch(%r{lib/.+\.rb})
  watch(%r{ext/.+\.(c|cpp|rb)})
  watch(%r{.*\.md}) { "doc" }
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end


