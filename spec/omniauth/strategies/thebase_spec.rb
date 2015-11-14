require 'spec_helper'

describe OmniAuth::Strategies::Thebase do
  subject do
    described_class.new({})
  end

  context "client options" do
    it 'returns correct site' do
      expect(subject.options.client_options.site).to eq("https://api.thebase.in")
    end

    it 'returns correct authorize_url' do
      expect(subject.options.client_options.authorize_url).to eq("/1/oauth/authorize")
    end

    it 'returns correct token_url' do
      expect(subject.options.client_options.token_url).to eq("/1/oauth/token")
    end
  end

  context "uid" do
    before do
      allow(subject).to receive(:raw_info) { {"shop_id" => "base" } }
    end

    it 'returns correct uid' do
      expect(subject.uid).to eq("base")
    end
  end

  context "extra" do
    before do
      allow(subject).to receive(:raw_info) { { "shop_id" => "base" } }
    end

    it 'returns correct extra block' do
      expect(subject.extra).to eq( { raw_info: {"shop_id" => "base" } })
    end
  end

  context "#raw_info" do
    let(:access_token) { double('AccessToken', options: {}) }
    let(:response) { double('Response', parsed: { "user" => { "shop_id" => "base" } } ) }

    before do
      allow(subject).to receive(:access_token) { access_token }
    end

    it "returns raw_info" do
      allow(access_token).to receive(:get).with('/1/users/me') { response }
      expect(subject.raw_info).to eq({ "shop_id" => "base" })
    end
  end
end
