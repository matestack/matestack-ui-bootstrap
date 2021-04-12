module Dummy::Pages::Products::Form

  def product_form_partial form_config
    matestack_form form_config do

      div class: "mb-3" do
        bs_form_input key: :name, label: "Name", type: :text
      end
      div class: "mb-3" do
        bs_form_input key: :description, label: "Description", type: :text
      end
      div class: "mb-3" do
        bs_form_input key: :price_in_euro, label: "Price €", type: :decimal
      end

      div class: "mb-3" do
        bs_form_submit button_variant: :primary, spinner_variant: :light, text: "Submit"
      end

    end
  end


end
