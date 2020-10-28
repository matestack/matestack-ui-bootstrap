class Bootstrap::Content::Table < Matestack::Ui::Component
  include Matestack::Ui::Core::Collection::Helper

  optional class: { as: :bs_class }, id: { as: :bs_id }
  # Smart Table Attributes
  optional :including, :filter, :filter_option, :base_query, :pagination, :order

  # Bootstrap Table Attributes
  optional :variant, :with_index, :striped, :hoverable, :borderless, :border_variant
  optional :responsive
  optional :thead_class, :tbody_class, :tfoot_class

  def prepare
    @collection_id = bs_id ||= "smarttable"
    # model = base_query.model
    # model_name = model.model_name.name

    current_filter = get_collection_filter(@collection_id)
    current_order = get_collection_order(@collection_id) 
    
    filtered_query = base_query

    if order.present?
      if current_order.count < 1
        filtered_query = base_query.order(order)
      else
        filtered_query = base_query.order(current_order)
      end
    end

    if filter.present?
      filter.each do |key|
        value = current_filter[key.to_sym]
        puts "key = #{key}"
        if value.present? 
          #TODO: checking for . option like person.name is not working
          if key.to_s.include? "."
            puts "Key including . "
            associated_name = key.to_s.split(".").first
            filtered_query = filtered_query.joins(associated_name.to_sym)
            table_name = model.reflections[associated_name].table_name.name
            puts "Table Name --> #{table_name}"
            key = key.to_s.gsub(associated_name, table_name)
          else
            key = key.to_sym
            case filter_option
            when :equals
              filtered_query = filtered_query.where("#{key}": value)
            when :like 
              filtered_query = filtered_query.where("lower(#{key}) LIKE ?", "%#{value.downcase}%")
            else
              filtered_query = filtered_query
            end
          end
        end
      end
    end
    # Core Collection
    if pagination.present?
      @collection = set_collection(
        id: @collection_id,
        data: filtered_query,
        init_limit: pagination,
        base_count: base_query.count,
        filtered_count: filtered_query.count
      )
    else
      @collection = set_collection({
        id: @collection_id,
        data: filtered_query,
        base_count: base_query.count,
        filtered_count: filtered_query.count
      })

    end
  end

  def response
    div class: "py-2" do
      filter_partial if filter.present?
      ordering if order.present?
    end
    # automatically generated table for a given array, hash or collection
    # needs to be evaluated how you would pass in a collection and attributes you want to display
    async id: @collection_id, rerender_on: "#{@collection_id}-update" do
      table table_attributes do
        table_head_partial
        table_body_partial
        table_footer_partial
      end
    end
  end

  protected
  
  def filter_partial
    collection_filter @collection.config do
      filter.each do |key|
        collection_filter_input key: key, type: :text, placeholder: key.to_s
      end
      collection_filter_submit do
        btn text: "Filter"
      end
      collection_filter_reset do
        btn text: "Reset"
      end
    end
  end

  def ordering
    collection_order @collection.config do
      plain "sort by:"
      including.each do |key|
        collection_order_toggle key: key do
          btn do
            collection_order_toggle_indicator key: key, asc: '&#8593;', desc: '&#8595;'
            plain key.to_s
          end
        end
      end
    end
  end

  def table_head_partial
    thead class: thead_class do
      tr do
        th attributes: { 'scope': 'col' }, text: "#" if with_index
        including.each do |value|
          th attributes: { 'scope': 'col' }, text: value.to_s.gsub("_", " ").capitalize
        end
      end
    end
  end

  def table_body_partial
    tbody class: tbody_class do
      collection_content @collection.config do
        @collection.paginated_data.each_with_index do |data, index|
          tr do
            th attributes: { 'scope': 'row' }, text: (index + 1) if with_index
            including.each do |_key, value|
              td text: data.instance_eval(_key.to_s) 
            end
          end
        end
        pagination_partial if pagination.present?
      end
    end
  end

  def table_footer_partial
    tfoot class: tfoot_class do
      tr do
        th text: "Footer" if with_index
        including.each do |value| 
          td text: "Footer"
        end
      end
    end
  end

  def pagination_partial
    plain "showing #{@collection.from}"
    plain "to #{@collection.to}"
    plain "of #{@collection.base_count}"
    collection_content_previous do
      btn text: "<" 
    end
    @collection.pages.each do |page|
      collection_content_page_link page: page do
        btn text: page 
      end
    end
    collection_content_next do
      btn text: ">" 
    end
  end

  # Custom Table Attributes 
  def table_attributes
    html_attributes.merge(
      id: @collection_id,
      class: table_classes
    )
  end

  def table_classes
    [].tap do |classes|
      classes << "table"
      classes << "table-#{variant}" if variant.present?
      classes << "table-striped" if striped
      classes << "table-hover" if hoverable
      classes << "table-bordered" if border_variant
      classes << "border-#{border_variant}" if border_variant
      classes << "table-borderless" if borderless
      classes << bs_class
    end.join(' ').strip
  end

end