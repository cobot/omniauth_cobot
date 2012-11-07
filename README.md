### About

This gem provides an [OmniAuth](https://github.com/intridea/omniauth) strategy for authenticating with [Cobot](http://cobot.me).

### Rails

Add the following as an initializer:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :cobot, '<client_id>', '<client_secret>', scope: 'read write'
    end

This gives you access to a variable `request.env['omniauth.auth']` in your authentication callback that looks like this:

* `uid` - the id of the user
* `info` - `{'email' => '<user email>', 'picture' => '<url>'}`
* `extra` - `{:raw_info => { "id": "<user id>", "email": "<email>", "picture": "<picture url>", "mac_addresses": ["<mac address>"...], "memberships": [{ "space_link": "<https://www.cobot.me/api/spaces/some-space>", "link": "<https://some-space.cobot.me/api/memberships/some-membership>" } ], "admin_of": [ { "space_link": "<https://www.cobot.me/api/spaces/some-space>", "name": "<admin name>" } ] }`
