namespace :locales do
  task :migrate do
    translation_files = Dir[Rails.root.join('config', 'locales', '*.yml')]

    translation_files.each do |translation_file|
      translations = YAML.load_file(translation_file)

      translations.each do |locale, values|

      end
    end
  end
end
