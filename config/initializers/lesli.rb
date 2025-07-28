
if defined? Lesli
    Lesli.configure do |config|
        config.demo = true
        config.security[:allow_multiaccount] = false
    end
end 
