require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
    
  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }

end

it "should have the right links on the layout" do
  visit root_path
  click_link "About"
  page.should have_selector 'title', text: full_title('')
  click_link "Help"
  page.should have_selector 'title', text: full_title('')
  click_link "Contact"
  page.should have_selector 'title', text: full_title('')
  click_link "Home"
  page.should have_selector 'title', text: full_title('')
  click_link "Sign up now!"
  page.should have_selector 'title', text: full_title('')
  click_link "sample app"
  page.should have_selector 'title', text: full_title('')
end


describe "Home page" do

  before { visit root_path }
  let(:heading){'Sample App'}
  let(:page_title){''}
  #it "should have the h1 'Sample App'" do
  #page.should have_selector('h1', :text => 'Sample App')
  #end
  
  it_should_behave_like "all static pages"

  #it { should have_selector('h1', text: 'Sample App') }
  
  #it { should have_selector('title', text: full_title(''))  }
  
  it { should_not have_selector('title', :text => '| Home') }

  describe "for signed-in users" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
      FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
      sign_in user
      visit root_path
    end

    it "should render the user's feed" do
      user.feed.each do |item|
        page.should have_selector("li##{item.id}", text: item.content)
      end
    end
  end
end

describe "Help page" do

  before{visit help_path}
  let(:heading){'Help'}
  let(:page_title){''}

  #it { should have_selector('h1',  text: 'Help')}

  #it { should have_selector('title',text: full_title('')) }
  
  it_should_behave_like "all static pages"

  it { should_not have_selector('title', :text => '| Help')}

end

describe "About page" do

  before {visit about_path}
  let(:heading){'About'}
  let(:page_title){''}

  #it { should have_selector('h1', text: 'About') }

  #it { should have_selector('title',text: full_title('')) }
  it_should_behave_like "all static pages"
  it { should_not have_selector('title', :text => '| About') }
end

describe "Contact page" do

  before {visit contact_path}
  let(:heading){'Contact'}
  let(:page_title){''}

  #it { should have_selector('h1', text: 'Contact') }

  #it { should have_selector('title',text: full_title('')) }
  it_should_behave_like "all static pages"
  #it "should not have a custom page title" do
  #visit contact_path
  #page.should_not have_selector('title', :text => '| Contact')
  #end

end
end