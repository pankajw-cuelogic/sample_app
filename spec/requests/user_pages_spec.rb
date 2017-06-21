require 'spec_helper'

describe "User Pages" do

	subject{ page }

	describe "profile page"	 do
		#code to make a user variable
		let(:user) {FactoryGirl.create(:user)}
		before { visit user_path(user) }
		
		it { should have_selector('h1', text: user.name)}
		it { should have_selector('title', text:user.name)}
	end

#	describe "signup page" do
#		before {visit signup_path}
#
#		it {should have_selector('h1', text:'sign up')}
#		it {should have_selector('title', text:'sign up')}

  #     describe "GET /user_pages" do
  #       it "works! (now write some real specs)" do
  #         # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #         get user_pages_index_path
  #         response.status.should be(200)
  #       end

  #	end


end
