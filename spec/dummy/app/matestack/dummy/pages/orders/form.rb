module Dummy::Pages::Orders::Form

  def order_form_partial form_config
    form form_config do

      div class: "mb-3" do
        bs_form_date key: :shipped_at, label: "Shipped at", enable_time: true
      end

      div class: "mb-3" do
        bs_form_submit button_variant: :primary, spinner_variant: :light, text: "Submit"
      end

    end
  end


end
