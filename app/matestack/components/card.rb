class Components::Card < Matestack::Ui::StaticComponent

  def response
    div id: "#{options[:id]}", class: "card #{options[:class]}" do
      
      # ---start card header----
      if options[:slots] && options[:slots][:header]
        div class: "card-header #{options[:header_class]}" do
          slot options[:slots][:header]
        end
      else
        if options[:header].present?
          div class: "card-header #{options[:header_class]}" do
            plain options[:header]
          end
        end
      end
      # ---end card header----

      if @options[:img_path].present? && @options[:img_pos] != :bottom
        img class: "card-img-top", path: @options[:img_path], alt: @options[:alt_text]
      end

      # ---start card body---
      div class: "card-body" do
        if options[:slots] && options[:slots][:body]
          slot options[:slots][:body]
        else
          heading size: title_size, class: 'card-title', text: @options[:title] if @options[:title].present?
          paragraph class: "card-text", text: options[:text] if options[:text].present?
        end
      end

      # custom body components
      yield_components
      
      if @options[:img_path].present? && @options[:img_pos] == :bottom
        img class: "card-img-bottom", path: @options[:img_path], alt: @options[:alt_text]
      end
      # ---end card body----

      # ---start card footer----
      if options[:slots] && options[:slots][:footer]
        div class: "card-footer #{options[:footer_class]}" do
          slot options[:slots][:footer]
        end
      else
        if options[:header].present?
          div class: "card-footer #{options[:footer_class]}" do
            plain options[:footer]
          end
        end
      end
      # ---end card footer----
    end
  end

  def title_size
    attrs = options[:title_size].present? ? options[:title_size] : 5
    attrs
  end
end