module Utils

  def stripped(html_string)
    html_string
      .gsub(/>\s+</, "><")
      .gsub("\n", "")
      .gsub(/\s+/, "")
  end

  def matestack_render(&block)
    example_context = self
    ExamplePage.define_method(:method_missing) do |*args|
      if example_context.respond_to? args.first
        example_context.send(*args, &block)
      else
        super(*args)
      end
    end
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
