# require "minitest/test_task"

# # Load local suites together against Builder's bundle and Rails application.
# # Packages without a local checkout or a test directory are simply omitted.
# Minitest::TestTask.create("test:engines") do |task|
#     test_paths = Dir[Rails.root.join("{engines,gems}/*/test")].sort.select do |path|
#         gemspec = Dir[File.join(File.dirname(path), "*.gemspec")].first
#         gemspec && Gem.loaded_specs.key?(File.basename(gemspec, ".gemspec"))
#     end

#     task.libs = [Rails.root.join("test").to_s, *test_paths]
#     task.test_globs = test_paths.map { |path| "#{path}/**/*_test.rb" }
#     task.framework = 'require "test_helper"; require "minitest/autorun"'
#     task.warning = false
# end
