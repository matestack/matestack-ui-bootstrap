class Components::Card < Matestack::Ui::StaticComponent

  def prepare
    @title_size = 5
    @title_size = options[:title_size] if options[:title_size].present?
  end

  def response
    div id: "#{options[:id]}", class: "card #{options[:class]}" do
      
      if options[:header]
        div class: "card-header #{options[:header_class]}" do
          plain options[:header]
        end
      end

      if options[:img_path] && options[:img_pos] != "bottom"
        img class: "card-img-top", path: options[:img_path], alt: options[:alt_text]
      end

      # ---start card body---
      div class: "card-body" do
        
        heading size: @title_size, class: 'card-title' do            
          if options[:slots] && options[:slots][:title]
            slot options[:slots][:title]
          else
            plain options[:title]
          end
        end

        if options[:text]
          paragraph class: "card-text", text: options[:text]
        end

        #custom components inside the card
        div do
          yield_components
        end

        if options[:slots] && options[:slots][:lists]
          slot options[:slots][:lists]
        end
        if options[:slots] && options[:slots][:actions]
          slot options[:slots][:actions]
        end
      end
      # ---end card body----
      if options[:img_path] && options[:img_pos] == 'bottom'
        img class: "card-img-bottom", path: options[:img_path], alt: options[:alt_text]
      end
      if options[:footer]
        div class: "card-footer #{options[:footer_class]}" do
          plain options[:footer]
        end
      end
    end
  end
end