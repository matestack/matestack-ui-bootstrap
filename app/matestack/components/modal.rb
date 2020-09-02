class Components::Modal < Matestack::Ui::StaticComponent

  optional class: { as: :bs_class }

  def response 
    div modal_attributes do
      div class: "modal-dialog" do
        div class: "modal-content" do
          
        end
      end
    end
  end

  protected

  def modal_attributes
    html_attributes.merge(
      class: modal_classes,
      attributes: { tabindex: "-1" }
    )
  end

  def modal_classes
    foo = [].tap do |classes|
      classes << 'modal'
      classes << bs_class
    end.join(' ').strip
  end
end