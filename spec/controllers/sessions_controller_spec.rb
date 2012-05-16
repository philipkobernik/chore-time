require 'spec_helper'

describe SessionsController do

  context "GET create" do
    before do
      User.stub(:find_or_create_from_auth_hash) { double 'user' }
    end

    let(:request) { get :create }

    it "should find or create a user from the auth_hash" do
      User.should_receive(:find_or_create_from_auth_hash)
      request
    end

    it "should set current_user" do
      controller.should_receive(:set_current_user)
      request
    end

    it "should redirect to '/'" do
      request
      response.should redirect_to '/'
    end
  end
end
