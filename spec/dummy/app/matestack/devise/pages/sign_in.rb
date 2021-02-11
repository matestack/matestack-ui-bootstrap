class Devise::Pages::SignIn < Matestack::Ui::Bootstrap::Pages::Devise::SignIn

  def form_config
    {
      for: :admin,
      method: :post,
      path: admin_session_path,
      delay: 500,
      success: {
        redirect: {
          follow_response: true
        }
      },
      failure: {
        emit: 'sign_in_failure'
      }
    }
  end

end
