class Bootstrap::Pages::Forms < Matestack::Ui::Page

  def response
    form form_config do

      form_select key: :key, options: [:test, :test1, :test2]

      bootstrap_checkbox key: :test, label: "Test"
      bootstrap_checkbox key: :test1, options: [0, 1]
      bootstrap_checkbox key: :test2, options: { 'Active': 1, 'Inactive': 0 }

      # replace with bootstrap form submit later
      form_submit do
        btn text: 'Save'
      end

      toast t_title: 'Success', show_on: :success, hide_on: :failure, autohide: false
      toast t_title: 'Failure', show_on: :failure, hide_on: :success, autohide: false
    end
  end

  private

  def form_config
    {
      for: :example,
      path: form_test_path,
      method: :post,
      success: {
        emit: :success
      },
      failure: {
        emit: :failure
      },
      class: 'm-5 py-5'
    }
  end

end