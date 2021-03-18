module Dummy::Components::Registry

  def dashboard_revenue(text=nil, options=nil, &block)
    Dummy::Components::Dashboard::Revenue
  end

  def dashboard_products(text=nil, options=nil, &block)
    Dummy::Components::Dashboard::Products
  end

  def dashboard_activity(text=nil, options=nil, &block)
    Dummy::Components::Dashboard::Activity
  end
  
  def md(text=nil, options=nil, &block)
    Dummy::Components::Md
  end

  def chart_js(text=nil, options=nil, &block)
    Dummy::Components::ChartJs
  end

  def form_flatpickr(text=nil, options=nil, &block)
    Dummy::Components::Form::Flatpick
  end

end
