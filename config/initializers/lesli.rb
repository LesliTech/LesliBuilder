
if defined? Lesli
    Lesli.configure do |config|
        config.demo = true
        config.security[:allow_multiaccount] = true
        config.locales = {
            :en => "English",       # English
            :de => "Deutsch",       # Deutsch/German
            :nl => "Dutch",         # Dutch/Nederlands/Netherlands
            :es => "Español",       # Español/Spanishn
            :it => "Italiano",      # Italiano/Italian
        }
    end
end 
