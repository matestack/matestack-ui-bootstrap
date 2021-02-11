module Dummy::Pages::Customers::Form

  def customer_form_partial form_config
    form form_config do

      [:first_name, :last_name, :email, :street, :house_number, :postal_code, :city].each do |key|
        div class: "mb-3" do
          bs_form_input key: key, label: key.to_s.humanize, type: :text
        end
      end

      div class: "mb-3" do
        bs_form_submit button_variant: :primary, spinner_variant: :light, text: "Submit"
      end

    end
  end


end
