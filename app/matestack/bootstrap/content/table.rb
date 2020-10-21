class Bootstrap::Content::Table < Matestack::Ui::Component
  include Matestack::Ui::Core::Collection::Helper

  optional class: { as: :bs_class }, id: { as: :bs_id }
  # Smart Table Attributes
  optional :include, :filter, :base_query, :pagination, :order

  # Bootstrap Table Attributes
  optional :variants, :with_index

  def prepare
    @collection_id = bs_id ||= "smarttable"
    # model = base_query.model
    # model_name = model.model_name

    current_filter = get_collection_filter(@collection_id)
    # filtered_query = base_query
    filtered_query = base_query.where('name LIKE ?', current_filter[:name])
    puts filtered_query
    # Core Collection
    @collection = set_collection(
      id: @collection_id,
      data: base_query,
      init_limit: (pagination || 20),
      base_count: base_query.count,
      filtered_count: filtered_query.count
    )
  end

  def response
    filter_partial
    # automatically generated table for a given array, hash or collection
    # needs to be evaluated how you would pass in a collection and attributes you want to display
    async id: "smart-collection", rerender_on: "#{@collection_id}-update" do
      table table_attributes do
        table_head_partial
        table_body_partial
      #   table_footer_partial
      end
    end

  end

  protected
  
  def filter_partial
    collection_filter @collection.config do
      collection_filter_input key: :name, type: :text 
      collection_filter_submit do
        btn text: "Filter"
      end
      collection_filter_reset do
        btn text: "Reset"
      end
    end
  end

  def table_head_partial
    thead do
      tr do
        th attributes: { 'scope': 'col' }, text: "#" if with_index
        include.each do |value|
          th attributes: { 'scope': 'col' }, text: value.capitalize
        end
      end
    end
  end

  def table_body_partial
    tbody do
      collection_content @collection.config do
        @collection.paginated_data.each_with_index do |data, index|
          tr do
            th attributes: { 'scope': 'row' }, text: index if with_index
            include.each do |_key, value|
              td text: data.instance_eval(_key.to_s) 
            end
          end
        end
        # pagination_partial
      end
    end
  end

  def table_footer_partial
    tfoot do
      tr do
        th text: "Footer" if with_index
        include.each do |value| 
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
    # With Bootstrap
    # pagination items: [
    #   collection_content_previous do
    #     { type: :link, text: "<" }
    #   end
    #   @collection.pages.each do |page|
    #     collection_content_page_link page: page do
    #       { type: :link, text: page }
    #     end
    #   end
    #   collection_content_next do
    #     { type: :link, text: ">" }
    #   end
    # ]
  end

  # Custom Attributes 
  def table_attributes
    html_attributes.merge(
      id: @collection_id,
      class: table_classes
    )
  end

  def table_classes
    [].tap do |classes|
      classes << "table"
      classes << bs_class
    end.join(' ').strip
  end

end