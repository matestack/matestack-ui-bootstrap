module Bootstrap::Content::Table::Filter

  def filter_partial
    collection_filter collection.config do
      row horizontal: :end, class: 'mt-2 mb-4' do
        div class: 'col-auto' do
          row do
            filters.each do |key, config|
              col do
                filter_input key, config
              end
            end
          end
        end
      end
    end
  end

  def filter_input(key, config)
    attributes = {
      key: key,
      type: :text,
      placeholder: config[:placeholder] || key.to_s,
    }
    case config[:type]
    when :select
      collection_filter_select attributes.merge(class: 'form-select', options: config[:options])
    else
      collection_filter_input attributes.merge(class: 'form-control')
    end
  end

end