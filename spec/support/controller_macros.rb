module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(:email => "konabanna@gmail.com",
                          :password => "0a0a0a0a",
                          :password_confirmation => "0a0a0a0a")
      @admin.confirm!
      sign_in @user
    end
  end
end

