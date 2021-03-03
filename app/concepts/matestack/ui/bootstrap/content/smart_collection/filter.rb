module Matestack::Ui::Bootstrap::Content::SmartCollection::Filter

  def filter_partial
    collection_filter collection.config do
      bs_row class: 'mt-2 mb-4' do
        div class: 'col-auto' do
          bs_row do
            processed_filters.each do |key, config|
              bs_col do
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
      collection_filter_select attributes.merge(id: key, class: 'form-select', options: config[:options])
    else
      collection_filter_input attributes.merge(id: key, class: 'form-control smart-collection-filter')
    end
  end

end
