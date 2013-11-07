require 'active_support/inflector'

guard :rspec, all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) do |m|
    "spec/lib/#{m[1]}_spec.rb"
  end
  watch('spec/spec_helper.rb') do 
    "spec"
  end

  # Rails example
  watch(%r{^app/(.+)\.rb$}) do |m|
    "spec/#{m[1]}_spec.rb" 
  end

  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$}) do |m|
    "spec/#{m[1]}#{m[2]}_spec.rb" 
  end

  # modified
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb",
     (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" :
                       "spec/requests/#{m[1].singularize}_pages_spec.rb")]
  end
  watch(%r{^app/views/(.+)/}) do |m|
    (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" :
                      "spec/requests/#{m[1].singularize}_pages_spec.rb")
  end
  watch(%r{^app/controllers/sessions_controller\.rb$}) do |m|
    "spec/requests/authentication_pages_spec.rb"
  end
  # end

  watch(%r{^spec/support/(.+)\.rb$}) do
    "spec"
  end

  watch('config/routes.rb') do
    "spec/routing"
  end

  watch('app/controllers/application_controller.rb') do
    "spec/controllers"
  end

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$}) do |m|
    "spec/features/#{m[1]}_spec.rb"
  end

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
  end
end