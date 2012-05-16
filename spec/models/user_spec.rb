require 'spec_helper'

describe User do

  context "class methods" do
    describe "#find_or_create_from_auth_hash" do

      let(:auth_hash) do
        {
          :provider => 'facebook',
          :uid => '123',
          :info => {
            :email => 'joe@example.com',
            :first_name => 'Joe',
            :last_name => 'Shmoe'
          }
        }
      end

      subject { User.find_or_create_from_auth_hash(auth_hash) }

      it "should call find_by_uid" do
        User.should_receive(:find_by_uid)
        subject
      end

      context "when user doesn't exist" do
        before do
          User.stub(:find_by_uid) { nil }
        end

        it "should create user" do
          User.should_receive(:create)

          subject
        end

        it "should return newly created user" do
          subject.should be_a User
        end

        its(:first_name) { should == 'Joe'}
        its(:last_name) { should == 'Shmoe'}
        its(:provider) { should == 'facebook'}
        its(:uid) { should == '123'}
        its(:email) { should == 'joe@example.com'}

      end

      context "when user exists" do
        before do
          User.stub(:find_by_uid) { :existing_user }
        end

        it "should return user" do
          User.find_or_create_from_auth_hash(auth_hash).should == :existing_user
        end
      end
    end
  end
end
