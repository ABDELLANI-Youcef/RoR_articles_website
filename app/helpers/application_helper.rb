module ApplicationHelper
  # navigation bar
  def sign_in_out_up
    if logged_in?
      content = link_to current_user.name, current_user, class: 'nav-link'
      content.concat '|'
      content.concat link_to 'Log out', logout_path, class: 'nav-link', method: :delete
    else
      content = link_to 'Log in', login_path, class: 'nav-link'
      content.concat '|'
      content.concat link_to 'Sign up', signup_path, class: 'nav-link'
      content
    end
  end

  def write_article_link
    link_to 'Write an Article', new_article_path, class: 'btn btn-outline-success my-2 my-sm-0' if logged_in?
  end
end
