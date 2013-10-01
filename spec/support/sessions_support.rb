module SessionSupport
	def setup_signed_in_user
		pass = "this=is-a-password"
		user = FactoryGirl.create :user, password: pass
		visit '/sessions/new'

		fill_in "email", with: user.email
		fill_in "password", with: pass
		click_button "Login"

		user
	end
end