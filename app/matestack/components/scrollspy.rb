class Components::Scrollspy < Matestack::Ui::StaticComponent

  optional :offset # pixel to offset from top, by default 10
  optional :method # find which section, by default auto
  optional :target # scroll target id

  def response 
    div scrollspy_attributes do
      yield_components
    end
  end

  protected

  def scrollspy_attributes
    html_attributes.merge(
    )
  end
end