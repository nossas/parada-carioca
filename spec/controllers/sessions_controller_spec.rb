require 'spec_helper'

describe SessionsController do
  before {request.env['omniauth.auth'] = OmniAuth::AuthHash.new({:uid => '1234567', :info => {}})}
  let(:user) {stub_model(User, :id => "1")}

  describe "GET create" do
    it "should call User.find_or_create_by_uid" do
      User.should_receive("find_or_create_by_uid", :with => "1234567").and_return(user)
      get :create, :provider => "facebook"
    end
  end

  describe ".current_user=" do
    it "should initialize sessions[:user_id]" do
      subject.current_user = user
      session[:user_id].should be_== 1
    end
    
    it "should initialize @current_user" do
      User.stub(:find_by_id).and_return(user)
      subject.current_user = user
      subject.current_user.should be_== user
    end

    it "should call User.find once" do
      User.should_receive(:find_by_id).once.and_return user
      session[:user_id] = 1
      subject.current_user
      subject.current_user
    end
  end
end
