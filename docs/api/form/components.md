# Matestack Bootstrap Form Components

**Please review the general form docs of the Matestack Ui Core docs!**

Docs in progress. Please review the examples

## Examples

```ruby
form form_config do

  bs_form_input key: :foo, type: :text, label: "Foo"
  bs_form_input key: :foo, type: :file, label: "Foo" # single file upload, multipart: true in form_config!
  bs_form_input key: :foo, type: :file, label: "Foo", mutliple: true # multi file upload, multipart: true in form_config!

  bs_form_select key: :foo, label: "Foo",  options: ["x", "y", "z"] # single value for foo
  bs_form_select key: :foo, label: "Foo",  options: ["x", "y", "z"], multiple: true # array for foo, multiselect

  bs_form_checkbox key: :foo, label: "Foo" # boolean value for foo
  bs_form_checkbox key: :foo, label: "Foo",  options: ["x", "y", "z"] # array for foo, multiselect

  bs_form_switch key: :foo, label: "Foo" # boolean value for foo

  bs_form_date key: :foo, label: "Foo", enable_time: true # date/timepicker via flatpickr library integration

  div class: "mb-3" do
    bs_form_submit button_variant: :primary, spinner_variant: :light, text: "Submit" # submit button with spinne animation
  end

end

def form_config
  {
    for: order,
    path: dummy_order_path(id: order.id),
    multipart: true, # required for file uploads!
    method: :put,
    delay: 300, # in order to see the spinner animation even if the server is fast enough ()
    success: {
      emit: :success,
      transition: {
        path: dummy_orders_path
      }
    },
    failure: {
      emit: :failure
    }
  }
end
```

