# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Cobot < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://www.cobot.me',
        authorize_url: 'https://www.cobot.me/oauth/authorize',
        token_url: 'https://www.cobot.me/oauth/access_token'
      }

      def client
        ::OAuth2::Client.new(
          options.client_id,
          options.client_secret,
          deep_symbolize(
            options.client_options.merge(
              authorize_url: space_subdomain_authorize_url
            )
          )
        )
      end

      def space_subdomain_authorize_url
        params = Rack::Utils.parse_nested_query(env['QUERY_STRING'])
        if (subdomain = params['cobot_space_subdomain'])
          options.client_options[:authorize_url].sub('www.', "#{subdomain}.")
        else
          options.client_options[:authorize_url]
        end
      end

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['email'],
          'picture' => raw_info['picture']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/api/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'cobot', 'Cobot'
