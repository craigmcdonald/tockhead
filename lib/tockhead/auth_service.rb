module Tockhead
  module AuthService

    class AuthenticationError < StandardError; end

    class << self

      def fetch_token(code=temp_code)
        raise AuthenticationError.new("Missing API authentication details.") unless client_id || client_secret
        render_response(RestClient.post(post_url, query(code), headers))
        rescue => e 
          raise AuthenticationError.new(e.message)
      end

      def temp_code
        File.open('tmp/auth_code').read rescue nil  # temporary development set-up.
      end

      private

      def render_response(response)
        response = JSON.parse(response).deep_symbolize_keys
        File.write('tmp/response',response)
        response[:access_token]
      end

      def tictail_url
        Tockhead::Settings.base_url || "https://tictail.com"
      end

      def post_url 
        tictail_url+"/oauth/token"
      end

      def query(code)
        { client_id: client_id, 
          client_secret: client_secret, 
          code: code, 
          grant_type: 'authorization_code'}
      end

      def client_id
        Tockhead::Settings.api_key
      end

      def client_secret
       Tockhead::Settings.secret
      end

      def headers
         {'Content-Type' => 'application/json'}
      end
    end
  end
end