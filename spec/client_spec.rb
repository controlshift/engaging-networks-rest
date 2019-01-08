require 'spec_helper'

describe EngagingNetworksRest::Client do
  let(:api_key) { 'abc123' }
  let(:content_type_header) { {'Content-Type' => 'application/json'} }

  subject { EngagingNetworksRest::Client.new(api_key: api_key) }

  describe '#authenticate!' do
    let(:auth_url) { "https://#{EngagingNetworksRest::Client::ENS_DOMAIN}/ens/service/authenticate" }
    let(:auth_key) { '75491e42-99dc-45ce-b637-a681bede875c' }
    let(:auth_key_body) { "{\"ens-auth-token\":\"#{auth_key}\",\"expires\":3600000}" }

    before :each do
      stub_request(:post, auth_url).with(body: api_key, headers: content_type_header).to_return(body: auth_key_body)
    end

    it 'should set the ens_auth_key on the client' do
      subject.authenticate!

      expect(subject.ens_auth_key).to eq auth_key
    end
  end
end
