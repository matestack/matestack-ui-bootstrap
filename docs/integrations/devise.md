# Devise

Please review the general guide on how to integrate `Devise` into Matestack within the docs of `matestack-ui-vuejs` --> [https://docs.matestack.io/matestack-ui-vuejs/integrations/devise](https://docs.matestack.io/matestack-ui-vuejs/integrations/devise)

Below you find examples implementing typical Devise flows with `matestack-ui-bootstrap`

## Devise Routes

`app/config/routes.rb`

```ruby
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
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

`app/matestack/devise/pages/register.rb`

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
