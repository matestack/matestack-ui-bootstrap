module Matestack::Ui::Bootstrap::Content::SmartCollection::Content

  def content
    bs_row class: 'smart-collection-content' do
      bs_col do
        async id: "#{collection_id}-async", rerender_on: "#{collection_id}-update, #{rerender_on} " do
          collection_content collection.config do
            div class: responsive_class do
              if slots && slots[:collection_rendering]
                slot slots[:collection_rendering].call(collection.paginated_data)
              elsif columns
                div class: "table-responsive" do
                  table table_attributes do
                    table_head
                    table_body
                    table_footer
                  end
                end
              end
            end
            paginate_partial if paginate.present?
          end
        end
      end
    end
  end

  def table_head
    thead do
      tr do
        columns&.each do |key, value|
          th text: value.is_a?(Hash) ? value[:heading] : value, class: cell_class(value), attributes: { scope: :col }
        end
        th if slots && slots[:table_item_actions]
      end
    end
  end

  def table_body
    tbody do
      collection.paginated_data.each_with_index do |data, index|
        tr class: 'align-middle' do
          columns.each do |key, value|
            cell(data, key, value)
          end
          if slots && slots[:table_item_actions]
            td class: 'text-end' do
              slot slots[:table_item_actions].call(data)
            end
          end
        end
      end
    end
  end

  def table_footer
    tfoot do
      tr do
        footer&.each do |value|
          td text: value
        end
      end
    end if footer
  end

  private

  def cell(data, key, value)
    td text: cell_text(data, key, value), class: cell_class(value)
  end

  def cell_class(value)
    [].tap do |classes|
      classes << "text-#{value[:text]}" if value[:text]
      classes << "align-#{value[:align]}" if value[:align]
    end.join(' ') if value.is_a? Hash
  end

  def cell_text(data, key, value)
    text = data.instance_eval(key.to_s)
    text = value[:format].call(text) if value.is_a?(Hash) && value[:format]
    text
  end

  def table_attributes
    klass = ['table'].tap do |classes|
      classes << "table-#{variant}" if variant
      classes << "table-striped" if striped
      classes << "table-hover" if hoverable
      classes << "table-bordered border-#{border_variant}" if border_variant
      classes << "table-borderless" if borderless
    end.join(' ').strip
    { id: collection_id, class: klass }
  end

  def responsive_class
    return unless responsive
    responsive === true ? 'table-responsive' : "table-responsive-#{responsive}"
  end

end
