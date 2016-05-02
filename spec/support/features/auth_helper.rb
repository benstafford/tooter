module Features
  def sign_in(user)
    visit login_path

    submit_login_form(user.username, user.password)
  end
end
