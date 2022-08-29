# Devise

Please review the general guide on how to integrate `Devise` into Matestack within the docs of `matestack-ui-vuejs` --> [https://docs.matestack.io/matestack-ui-vuejs/integrations/devise](https://docs.matestack.io/matestack-ui-vuejs/integrations/devise)

Below you find examples implementing typical Devise flows with `matestack-ui-bootstrap`

## Devise Routes

`app/config/routes.rb`

```ruby
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    passwords: 'users/passwords'
  }
  # ...
  
end
```

## Devise Controllers

`app/controllers/users/sessions_controller`

```ruby
class Users::SessionsController < Devise::SessionsController

  respond_to :html, :json

  # override in order to render a page
  def new
    render Devise::Pages::SignIn, matestack_layout: Devise::Layout
  end

end
```

`app/controllers/users/registrations_controller`

```ruby
class Users::RegistrationsController < Devise::RegistrationsController

  respond_to :html, :json

  # override in order to render a page
  def new
    render Devise::Pages::Registration, matestack_layout: Devise::Layout
  end

end

```

`app/controllers/users/passwords_controller.rb`

```ruby
class Users::PasswordsController < Devise::PasswordsController

  respond_to :html, :json

  # override in order to render a page
  def new
    render Devise::Pages::Passwords::Forgot, matestack_layout: Devise::Layout
  end

  # optional: override default create action, reason below
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      # respond_with(resource)
      # override above seen default behavior as this would trigger an error when user is not found by email in DB
      # this indirectly is exposing the info, which emails DO exist in DB by try and error which is not desired IMO
      # just respond as if everything is fine even if the email is not found in DB or something
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    end
  end

  # override in order to render a page
  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]

    render Devise::Pages::Passwords::Edit, matestack_layout: Devise::Layout
  end

end
```

## Devise Pages Layout

`app/matestack/devise/layout.rb`

```ruby
class Devise::Layout < Matestack::Ui::Layout

  def response
    matestack_vue_js_app do
      page_switch do
        yield
      end
    end
  end

end

```

## Login Page

`app/matestack/devise/pages/sign_in.rb`

```ruby
class Devise::Pages::SignIn < Matestack::Ui::Page

  def response
    bs_container class: "mt-5" do
      bs_row class: "mt-5", vertical: :center, horizontal: :center do
        bs_col lg: 4 do
          login_form_partial
        end
      end
    end
  end

  private

  def login_form_partial
    section class: "mt-5 rounded p-4 mb-4" do
      div class: "d-flex justify-content-between" do
        heading size: 2, text: 'Sign In'
        transition path: new_user_registration_path, delay: 300 do
          bs_btn outline: true, variant: :primary, text: "Register"
        end
      end
      matestack_form form_config do
        div class: "mb-3 mt-4" do
          bs_form_input label: 'Email', key: :email, type: :email
        end
        div class: "mb-3" do
          bs_form_input label: 'Password', key: :password, type: :password
        end
        div class: "mb-3" do
          bs_form_submit text: "Sign in"
        end
      end
      toggle show_on: 'sign_in_failure' do
        bs_alert variant: :danger do
          plain 'Your email or password is not valid.'
        end
      end
      hr
      div class: "mt-3" do
        transition path: new_user_password_path, delay: 300 do
          bs_btn outline: true, variant: :secondary, text: "Forgot your password?"
        end
      end
    end
  end

  def form_config
    {
      for: :user, # or whatever you're using
      method: :post,
      path: user_session_path(format: :json), # or whatever you're using
      delay: 500,
      success: {
        redirect: {
          path: your_after_login_path
        }
      },
      failure: {
        emit: 'sign_in_failure'
      }
    }
  end

end
```

## Register Page

`app/matestack/devise/pages/registration.rb`

```ruby
class Devise::Pages::Registration < Matestack::Ui::Page

  def response
    bs_container class: "mt-5" do
      bs_row class: "mt-5", vertical: :center, horizontal: :center do
        bs_col lg: 4 do
          register_form_partial
        end
      end
    end
  end

  private

  def register_form_partial
    section class: "mt-5 rounded p-4 mb-4" do
      div class: "d-flex justify-content-between" do
        heading size: 2, text: 'Register'
        transition path: user_session_path, delay: 300 do
          bs_btn outline: true, variant: :primary, text: "Sign in"
        end
      end
      matestack_form form_config do
        div class: "mb-3 mt-4" do
          bs_form_input label: 'Email', key: :email, type: :email
        end
        div class: "mb-3" do
          bs_form_input label: 'Password', key: :password, type: :password
        end
        div class: "mb-3" do
          bs_form_input label: 'Password Confirmation', key: :password_confirmation, type: :password
        end
        div class: "mb-3" do
          bs_form_submit text: "Register"
        end
      end
      toggle show_on: 'register_failure' do
        bs_alert variant: :danger do
          plain 'Registration failed. Do you already have an account?'
        end
      end
    end
  end

  def form_config
    {
      for: :user, # or whatever you're using
      method: :post,
      path: user_registration_path(format: :json), # or whatever you're using
      delay: 500,
      success: {
        redirect: {
          path: your_after_login_path
        }
      },
      failure: {
        emit: 'register_failure'
      }
    }
  end

end

```

### Registration Update

A registration update for a logged in user somewhere within your app could be approached like that:

```ruby
password_change_config = {
  for: current_user, # or whatever you're using
  method: :put,
  path: user_registration_path(format: :json), # or whatever you're using
  delay: 500,
  success: {
    emit: 'success--user-settings-form',
    reset: true
  },
  failure: {
    emit: 'failure--user-settings-form'
  }
}
    
matestack_form password_change_config do
  div class: "mb-2" do
    bs_form_input key: :email,
      type: :email,
      label: "Email"
  end
  div class: "mb-2" do
    bs_form_input key: :password,
      type: :password,
      label: "New password",
      form_text: "leave blank if you don't want to change the password"
  end
  div class: "mb-2" do
    bs_form_input key: :password_confirmation,
      type: :password,
      label: "New password confirmation",
      form_text: "leave blank if you don't want to change the password"
  end
  div class: "mb-4" do
    bs_form_input key: :current_password,
      type: :password,
      label: "Current password",
      form_text: "we need your current password to confirm your changes"
  end
  div class: "mb-2" do
    bs_form_submit
  end
end
```

### Password Forgotten Page

`app/matestack/devise/pages/passwords/forgot.rb`

```ruby
class Devise::Pages::Passwords::Forgot < Matestack::Ui::Page

  def response
    bs_container class: "mt-5" do
      bs_row class: "mt-5", vertical: :center, horizontal: :center do
        bs_col lg: 4 do
          form_partial
        end
      end
    end
  end

  private

    def form_partial
    section class: "mt-5 rounded p-4 mb-4" do
      div class: "d-flex justify-content-between" do
        heading size: 2, text: 'YourAppName - Password'
        transition path: user_session_path, delay: 300 do
          bs_btn outline: true, variant: :primary, text: "Sign in"
        end
      end
      matestack_form form_config do
        div class: "mb-3 mt-4" do
          bs_form_input label: 'Email', key: :email, type: :email
        end
        div class: "mb-3" do
          bs_form_submit text: "Request new password"
        end
      end
      toggle show_on: 'request_password_success' do
        bs_alert variant: :success do
          plain "We've sent you an email with a password reset link."
        end
      end
      toggle show_on: 'request_password_failure', hide_after: 5000 do
        bs_alert variant: :danger do
          plain 'Something went wrong.'
        end
      end
    end
  end

  def form_config
    {
      for: :user, # or whatever you're using
      method: :post,
      path: user_password_path(format: :json),
      delay: 500,
      success: {
        emit: 'request_password_success'
      },
      failure: {
        emit: 'request_password_failure'
      }
    }
  end

end
```

### Passwords Edit Page

`app/matestack/devise/pages/passwords/edit.rb`

```ruby
class Devise::Pages::Passwords::Edit < Matestack::Ui::Page

  def response
    bs_container class: "mt-5" do
      bs_row class: "mt-5", vertical: :center, horizontal: :center do
        bs_col lg: 4 do
          form_partial
        end
      end
    end
  end

  private

  def form_partial
    section class: "mt-5 rounded p-4 mb-4" do
      div class: "d-flex justify-content-between" do
        heading size: 2, text: 'Set new Password'
      end
      matestack_form form_config do
        form_input type: :hidden, key: :reset_password_token, init: params[:reset_password_token]
        div class: "mb-3 mt-4" do
          bs_form_input label: 'Password', key: :password, type: :password
        end
        div class: "mb-3" do
          bs_form_input label: 'Password confirmation', key: :password_confirmation, type: :password
        end
        div class: "mb-3" do
          bs_form_submit text: "Set new password"
        end
      end
      toggle show_on: 'password_failure', hide_after: 5000 do
        bs_alert variant: :danger do
          plain 'Something went wrong.'
        end
      end
    end
  end

  def form_config
    {
      for: :user, # or whatever you're using
      method: :put,
      path: user_password_path(format: :json),
      delay: 500,
      success: {
        redirect: {
          path: your_after_login_path# or whatever you're using
        }
      },
      failure: {
        emit: 'password_failure'
      }
    }
  end

end
```
