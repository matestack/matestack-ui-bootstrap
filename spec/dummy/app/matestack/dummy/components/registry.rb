module Dummy::Components::Registry

  def dashboard_revenue(text=nil, options=nil, &block)
    Dummy::Components::Dashboard::Revenue.(text, options, &block)
  end

  def dashboard_products(text=nil, options=nil, &block)
    Dummy::Components::Dashboard::Products.(text, options, &block)
  end

  def dashboard_activity(text=nil, options=nil, &block)
    Dummy::Components::Dashboard::Activity.(text, options, &block)
  end
  
  def md(text=nil, options=nil, &block)
    Dummy::Components::Md.(text, options, &block)
  end

  def chart_js(text=nil, options=nil, &block)
    Dummy::Components::ChartJs.(text, options, &block)
  end

  def form_flatpickr(text=nil, options=nil, &block)
    Dummy::Components::Form::Flatpickr.(text, options, &block)
  end

end
