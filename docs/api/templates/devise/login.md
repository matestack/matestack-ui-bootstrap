# Matestack Bootstrap Devise Sign In Page

**Please review how to properly integrate Devise into Matestack on the Matestack Ui Core docs!**

Styled Devise sign in form centered on page.

Docs in progress. Please review the examples

## Examples

### Example 1: Simple sign in with redirect and error message rendering



```ruby
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

```
