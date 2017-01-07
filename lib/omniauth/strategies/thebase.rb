module OmniAuth
  module Strategies
    class Thebase < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://api.thebase.in',
        authorize_url: '/1/oauth/authorize',
        token_url: '/1/oauth/token'
      }

      uid { raw_info["shop_id"] }

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/1/users/me').parsed["user"] || {}
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
