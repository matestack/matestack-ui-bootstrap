class Bootstrap::Pages::Dashboard < Matestack::Ui::Page

  def response
    container do
      row do
        Person.all.each do |person|
          col sm: 4, class: "mt-3" do
            card title: person.name,
              img_path: asset_pack_url('media/images/avatar-placeholder.png'),
              class: "shadow-sm border-0" do
                card_body_for(person)
              end
          end
        end
      end
    end
  end

  def card_body_for person
    div class: "px-3 pb-3" do
      small do
        b text: "Email:"
        plain person.email
      end
      br
      transition path: form_path(id: person.id) do
        btn size: :sm, text: "edit", class: "mt-3"
      end
    end
  end
  
end
