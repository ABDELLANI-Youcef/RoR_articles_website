module ApplicationHelper
  # navigation bar
  def sign_in_out_up
    if logged_in?
      link_to 'Log out', logout_path, class: "nav-link", method: :delete
    else
      content = link_to 'Log in', login_path, class: "nav-link"
      content.concat link_to 'Sign up', signup_path, class: "nav-link"
      return content
    end
  end
end
