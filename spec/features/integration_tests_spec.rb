require 'spec_helper'

feature "login" do
  describe "Welcome page requires http authentication" do
    describe "land on page" do
      it "has greeting and login form on root (site index)" do
        visit "/"
        save_and_open_page
        expect(page).to have_content('Welcome to Social Trainer')
         fill_in 'Email', :with => "n@n.com"
         fill_in 'Password', :with => "n"
        click_button 'Login'

        assert_response "success"
      end

      # => FUTURE TEST MATERIAL
      # => put in user.name/user.password with MOCK
      # user = User.find
      # => click submit
      # => test success of hitting next route
      # => test for session key
    end
  end
end
