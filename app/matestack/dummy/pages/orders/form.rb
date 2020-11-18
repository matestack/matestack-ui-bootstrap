module Dummy::Pages::Orders::Form

  def order_form_partial form_config
    form form_config do

      div class: "mb-3" do
        bootstrap_date key: :shipped_at, label: "Shipped at"
      end

      div class: "mb-3" do
        bootstrap_submit button_variant: :primary, spinner_variant: :light, text: "Submit"
      end

    end
  end


end
