module Tockhead
  
  class Settings

    cattr_accessor :api_key
    cattr_accessor :secret
    cattr_accessor :base_url

    # set api key and secret from file - TEMP # 
    contents = File.open('tmp/creds').read rescue nil
    contents = contents.split(",")
    self.api_key = contents[0]
    self.secret = contents[1]

    class << self

      def config(params)
        params.each { |k,value| send("#{k}=", value) }
      end

    end



  end

end
