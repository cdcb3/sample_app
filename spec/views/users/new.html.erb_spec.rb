require 'spec_helper'

describe "users/new.html.erb" do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { page }
  describe "Signup page" do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
end
