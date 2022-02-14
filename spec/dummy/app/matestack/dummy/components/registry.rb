module Dummy::Components::Registry

  def md(text=nil, options=nil, &block)
    Dummy::Components::Md.call(text, options, &block)
  end

  def chart_js(text=nil, options=nil, &block)
    Dummy::Components::ChartJs.call(text, options, &block)
  end

  def form_flatpickr(text=nil, options=nil, &block)
    Dummy::Components::Form::Flatpickr.call(text, options, &block)
  end

end
