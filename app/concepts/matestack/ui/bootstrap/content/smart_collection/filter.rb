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
      id: key,
      key: key,
      type: :text,
      placeholder: config[:placeholder] || key.to_s,
      label: config[:label]
    }
    case config[:type]
    when :select
      bs_form_select attributes.merge(options: config[:options])
    when :checkbox
      bs_form_checkbox attributes.merge(options: config[:options])
    else
      bs_form_input attributes.merge(class: 'smart-collection-filter')
    end
  end

end
