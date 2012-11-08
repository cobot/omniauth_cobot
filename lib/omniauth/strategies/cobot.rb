require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Cobot < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://www.cobot.me',
        :authorize_url => 'https://www.cobot.me/oauth2/authorize',
        :token_url => 'https://www.cobot.me/oauth2/access_token'
      }

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['email'],
          'picture' => raw_info['picture']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/api/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'cobot', 'Cobot'
