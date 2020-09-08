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

end