require 'spec_helper'

describe EngagingNetworksRest::Client::Pages do
  let(:api_key) { 'abc-123' }
  let(:ens_auth_key) { 'tmp-auth-key-456' }
  let(:standard_headers) { {'Content-Type' => 'application/json', 'ens-auth-token' => ens_auth_key} }

  subject { EngagingNetworksRest::Client.new(api_key: api_key) }

  describe '#pages' do
    let(:page_type) { 'dcf' }
    let(:page_status) { 'live' }
    let(:pages_url) { "https://#{EngagingNetworksRest::Client::ENS_DOMAIN}/ens/service/page" }

    # The API docs don't actually say what this response looks like, so this is a guess.
    # Fortunately, it doesn't actually matter for our purposes, since we just return whatever JSON we get.
    let(:response) { [{'id' => 123, 'title' => 'A page'}, {'id' => 234, 'title' => 'Another page'}] }

    shared_examples_for 'list pages' do
      it 'should get pages' do
        stub_request(:get, pages_url).with(headers: standard_headers, query: {'type' => page_type, 'status' => page_status})
          .to_return(body: response.to_json)

        expect(subject.pages(type: page_type, status: page_status)).to eq response
      end

      it 'should omit status param if not specified' do
        stub_request(:get, pages_url).with(headers: standard_headers, query: {'type' => page_type})
          .to_return(body: response.to_json)

        expect(subject.pages(type: page_type)).to eq response
      end
    end

    context 'not already authenticated' do
      before :each do
        expect(subject).to receive(:authenticate!) do
          allow(subject).to receive(:ens_auth_key).and_return(ens_auth_key)
        end
      end

      include_examples 'list pages'
    end

    context 'already authenticated' do
      before :each do
        allow(subject).to receive(:ens_auth_key).and_return(ens_auth_key)
      end

      include_examples 'list pages'
    end
  end

  describe '#process_page_request' do
    let(:page_id) { 234 }
    let(:page_req_url) { "https://#{EngagingNetworksRest::Client::ENS_DOMAIN}/ens/service/page/#{page_id}/process" }
    let(:email) { Faker::Internet.email }
    let(:supporter_hash) { {'firstName' => 'Joe', 'lastName' => 'Smith', 'emailAddress' => email, 'customField1' => 'foo'} }
    let(:response) { {'id' => '1234567', 'status' => 'SUCCESS', 'supporterEmailAddress' => email, 'supporterId' => '98765'} }

    shared_examples_for 'process page request' do
      it 'should process the page request' do
        stub_request(:post, page_req_url).with(body: {supporter: supporter_hash}.to_json, headers: standard_headers)
          .to_return(body: response.to_json)

        expect(subject.process_page_request(page_id: page_id, body: {supporter: supporter_hash})).to eq response
      end
    end

    context 'not already authenticated' do
      before :each do
        expect(subject).to receive(:authenticate!) do
          allow(subject).to receive(:ens_auth_key).and_return(ens_auth_key)
        end
      end

      include_examples 'process page request'
    end

    context 'already authenticated' do
      before :each do
        allow(subject).to receive(:ens_auth_key).and_return(ens_auth_key)
      end

      include_examples 'process page request'
    end
  end
end
