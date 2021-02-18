module Matestack::Ui::Bootstrap::Content::Collection::Filter

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
      collection_filter_select attributes.merge(class: 'form-select', options: config[:options])
    else
      collection_filter_input attributes.merge(class: 'form-control')
    end
  end

end
