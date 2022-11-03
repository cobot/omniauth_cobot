require 'spec_helper'

RSpec.describe OmniAuth::Strategies::Cobot do
  let(:app) do
    lambda do |_env|
      [200, {}, ["Hello."]]
    end
  end
  let(:strategy) { Class.new(OmniAuth::Strategies::Cobot) }

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end


  it 'takes the cobot_space_sudomain query param and changes the subdomain of the authorize_url' do
    subject = strategy
      .new(app, client_options: {authorize_url: 'https://www.cobot.me'})

    subject.call!(
      {
        'rack.session' => {},
        'QUERY_STRING' => 'cobot_space_subdomain=my-space'
      }
    )
    
    expect(subject.client.authorize_url)
      .to eq('https://my-space.cobot.me')
  end

  it 'does not change the subdomain of the authorize_url when no cobot_space_subdomain passed' do
    subject = strategy
      .new(app, client_options: {authorize_url: 'https://www.cobot.me'})

    subject.call!(
      {
        'rack.session' => {}
      }
    )
    
    expect(subject.client.authorize_url)
      .to eq('https://www.cobot.me')
  end

  it 'does nothing if no authorize_url configured' do
    subject = strategy
      .new(app, {})

    subject.call!(
      {
        'rack.session' => {}
      }
    )
    
    expect(subject.client.authorize_url)
      .to eq('https://www.cobot.me/oauth/authorize')
  end
      
end