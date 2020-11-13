module Utils

  def stripped(html_string)
    html_string
      .gsub(/>\s+</, "><")
      .gsub("\n", "")
      .gsub(/\s+/, "")
  end

  def matestack_render(&block)
    ExamplePage.define_method(:response, block)
  end

  def get_form_config(path: nil)
    {
      for: :wrapper,
      path: path,
      method: :post,
      success: {
        emit: :success
      },
      failure: {
        emit: :failure
      }
    }
  end

end
