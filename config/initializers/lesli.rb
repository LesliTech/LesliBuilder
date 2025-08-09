
if defined? Lesli
    Lesli.configure do |config|
        config.demo = true
        config.security[:allow_multiaccount] = false
        config.locales = {
            :en => "English",       # English
            :es => "Español",       # Español/Spanish
            :it => "Italiano",      # Italiano/Italian
        }
    end
end 
