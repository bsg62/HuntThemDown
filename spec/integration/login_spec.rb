require 'spec_helper'

feature 'Login' do

  context 'user is logged out' do
    scenario 'redirect to login page' do
      visit '/'
      expect(page.status_code).to be 200
      expect(current_path).to eql '/login'
      expect(page).to have_content('Login')
    end
  end

end