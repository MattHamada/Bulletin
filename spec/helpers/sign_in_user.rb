def sign_in_user
  visit root_path
  click_link 'Sign in'
  fill_in 'session_username', with: user.username
  fill_in 'session_password', with: user.password
  click_button 'SIGN IN'
end