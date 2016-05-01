module Features
  def submit_login_form(username, password)
    fill_in "Username", with: username
    fill_in "Password", with: password
    click_on "Submit"
  end
end
