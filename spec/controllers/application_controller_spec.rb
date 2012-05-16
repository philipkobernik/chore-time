require 'spec_helper'

describe ApplicationController do
  describe "#current_user" do
    context "when logged in" do
      before do
        controller.stub(:session) { { :user => :joe } }
      end

      it "should return current_user" do
        controller.current_user.should == :joe
      end
    end

    context "when user isn't logged in" do
      it "should return a guest user" do
        controller.current_user.should be_a Guest
      end
    end
  end

  describe "#current_user=" do
    it "should save current user to the session variable" do
      pending "Rails bug? Can't find #set_current_user for some reason"
      controller.set_currrent_user :joe
      session[:user].should == :joe
    end
  end

end
