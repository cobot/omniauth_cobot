### About

This gem provides an [OmniAuth](https://github.com/intridea/omniauth) strategy for authenticating with [Cobot](http://cobot.me).

### Rails

Add the following to your Gemfile:

````ruby
gem 'omniauth_cobot'
gem 'omniauth-rails_csrf_protection', '~>1.0.0'
``

Add the following as an initializer:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cobot, '<client_id>', '<client_secret>', scope: 'read write'
end
````

To authenticate a user against Cobot, send them to `/auth/cobot`.

If authenticating in the context of a Cobot space, e.g. if your app is inside an ifram on Cobot, pass the space's subdomain by sending the user to `/auth/cobot/cobot_space_subdomain=<space-sudbomain>`. This ensures users don't have to log in again for their space on Cobot when that space has a custom domain.

After the user completed the OAuth flow, they are redirected back to `/auth/cobot/callback`, which should be routed to a controller action.

In the controller action you have access to a variable `request.env['omniauth.auth']` that looks like this:

- `uid` - the id of the user
- `credentials` - `{'token' => '<access token>'}`
- `info` - `{'email' => '<user email>', 'picture' => '<url>'}`
- `extra` - `{:raw_info => { "id": "<user id>", "email": "<email>", "picture": "<picture url>", "mac_addresses": ["<mac address>"...], "memberships": [{ "space_link": "<https://www.cobot.me/api/spaces/some-space>", "link": "<https://some-space.cobot.me/api/memberships/some-membership>" } ], "admin_of": [ { "space_link": "<https://www.cobot.me/api/spaces/some-space>", "name": "<admin name>" } ] }`
