require 'spec_helper'

describe Tockhead::Settings do 

  it "should exit" do 
    @settings = Tockhead::Settings.new
    expect(@settings.class).to respond_to(:config)
  end

  context "the config class method" do 

    let(:settings) { Tockhead::Settings.new }

    it "should set the cattr_accessor values" do 
      Tockhead::Settings.config(api_key: "test", secret: "secret")
      expect(settings.class.api_key).to eq("test")
      expect(settings.class.secret).to eq("secret")
    end
  end
end