class Devise::Pages::SignIn < ApplicationPage

  def response
    bs_container class: "mt-5" do
      bs_row class: "mt-5", vertical: :center, horizontal: :center do
        bs_col md:4 do
          login_form_partial
        end
      end
    end
  end

  private

    def login_form_partial
      section class: "mt-5 rounded shadow-sm p-4 mb-4" do
        heading 'Sign in', size: 2
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
          plain 'Your email or password is not valid.'
        end
        br
        small "Dummy user: admin@matestack.io"
        br
        small "Dummy password: password"
      end
    end

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
