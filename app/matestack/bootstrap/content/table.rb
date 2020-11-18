class Bootstrap::Content::Table < Matestack::Ui::Component
  include Matestack::Ui::Core::Collection::Helper

  optional class: { as: :bs_class }, id: { as: :bs_id }
  # Smart Table Attributes
  optional :columns, :filters, :base_query, :paginate, :order
  optional :row_actions
  optional :rerender_on

  # Bootstrap Table Attributes
  optional :variant, :with_index, :striped, :hoverable, :borderless, :border_variant
  optional :responsive
  optional :footer
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


    if filters.present?
      filters.each do |filter_config|
        key = filter_config[:column]
        value = current_filter[key.to_sym]
        if value.present?
          #TODO: checking for . option like person.name is not working
          if ".".in? key.to_s # key.to_s.include? "."
            associated_name = key.to_s.split(".").first
            filtered_query = filtered_query.joins(associated_name.to_sym)
            table_name = model.reflections[associated_name].table_name.name
            key = key.to_s.gsub(associated_name, table_name)
          else
            key = key.to_sym
            case filter_config[:match]
            when :equals
              filtered_query = filtered_query.where("#{key}": value)
            when :like
              filtered_query = filtered_query.where("lower(#{key}) LIKE ?", "%#{value.downcase}%")
            else
              filtered_query = filtered_query.where("#{key}": value)
            end
          end
        end
      end
    end
    # Core Collection
    if paginate.present?
      @collection = set_collection(
        id: @collection_id,
        data: filtered_query,
        init_limit: paginate,
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
    filter_partial if filters.present?
    ordering_partial if order.present?
    content_partial
  end

  protected

  def filter_partial
    collection_filter @collection.config do
      row horizontal: :end, class: "mt-2 mb-4" do
        div class: "col-auto" do
          row do
            filters.each do |filter_config|
              col do
                if filter_config[:type] == :input
                  collection_filter_input key: filter_config[:column],
                    type: :text,
                    placeholder: filter_config[:placeholder] || filter_config[:column].to_s,
                    class: "form-control"
                end
                if filter_config[:type] == :dropdown
                  collection_filter_select key: filter_config[:column],
                    placeholder: filter_config[:placeholder] || filter_config[:column].to_s,
                    class: "form-select",
                    options: filter_config[:options]
                end
              end
            end
          end
        end
        div class: "col-auto" do
          collection_filter_submit do
            btn do
              bootstrap_icon name: "funnel-fill"
            end
          end
          collection_filter_reset do
            btn variant: :primary, outline: true do
              bootstrap_icon name: "x"
            end
          end
        end
      end
    end
  end

  def ordering_partial
    row do
      col do
        collection_order @collection.config do
          plain "sort by:"
          order.each do |key|
            collection_order_toggle key: key do
              btn do
                collection_order_toggle_indicator key: key, asc: '&#8593;', desc: '&#8595;'
                plain key.to_s
              end
            end
          end
        end
      end
    end
  end

  def content_partial
    # automatically generated table for a given array, hash or collection
    # needs to be evaluated how you would pass in a collection and attributes you want to display
    div class: "row", id: "content" do
      col do
        async id: @collection_id, rerender_on: "#{@collection_id}-update, #{rerender_on}" do
          div class: "#{ ((responsive == true) ? "table-responsive" : "table-responsive-#{responsive}") if responsive.present? }"  do
            collection_content @collection.config do
              table table_attributes do
                table_head_partial if columns.present?
                table_body_partial
                table_footer_partial if footer.present?
              end
              paginate_partial if paginate.present?
            end
          end
        end
      end
    end
  end

  def table_head_partial
    thead class: thead_class do
      tr do
        th attributes: { 'scope': 'col' }, text: "#" if with_index
        columns.each do |value|
          th attributes: { 'scope': 'col' }, text: value.to_s.gsub("_", " ").capitalize
        end
        if row_actions.present?
          td
        end
      end
    end
  end

  def table_body_partial
    tbody class: tbody_class do
      @collection.paginated_data.each_with_index do |data, index|
        row_partial data, index
      end
    end
  end

  def row_partial data, index
    tr class: "align-middle" do
      th attributes: { 'scope': 'row' }, text: (index + 1) if with_index
      if columns.present?
        columns.each do |_key, value|
          td text: data.instance_eval(_key.to_s)
        end
      end
      if row_actions.present?
        td class: "text-right" do
          row_actions.each do |action_config|
            if action_config[:type] == :action
              render_action(data, action_config)
            end
            if action_config[:type] == :transition
              render_transition(data, action_config)
            end
            if action_config[:type] == :link
              render_link(data, action_config)
            end
          end
        end
      end
    end
  end

  def render_action data, action_config
    action resolve_action_config(data, action_config) do
      btn outline: true, size: :sm, variant: action_config[:btn_variant] do
        bootstrap_icon name: action_config[:icon], size: 20 if action_config[:icon]
        plain action_config[:text] if action_config[:text]
      end
    end
  end

  def resolve_action_config data, action_config
    processed_action_config = action_config.clone
    processed_action_config[:params] = processed_action_config[:params].inject({}) { |h, (k, v)| h[k] = data.send(v); h }
    processed_action_config
  end

  def render_transition data, action_config
    transition resolve_transition_config(data, action_config) do
      btn outline: true, size: :sm, variant: action_config[:btn_variant] do
        bootstrap_icon name: action_config[:icon], size: 20 if action_config[:icon]
        plain action_config[:text] if action_config[:text]
      end
    end
  end

  def resolve_transition_config data, action_config
    processed_action_config = action_config.clone
    processed_action_config[:params] = processed_action_config[:params].inject({}) { |h, (k, v)| h[k] = data.send(v); h }
    processed_action_config
  end

  def render_link data, action_config
    link resolve_link_config(data, action_config) do
      btn outline: true, size: :sm, variant: action_config[:btn_variant] do
        bootstrap_icon name: action_config[:icon], size: 20 if action_config[:icon]
        plain action_config[:text] if action_config[:text]
      end
    end
  end

  def resolve_link_config data, action_config
    processed_action_config = action_config.clone
    processed_action_config[:params] = processed_action_config[:params].inject({}) { |h, (k, v)| h[k] = data.send(v); h }
    processed_action_config
  end

  def table_footer_partial
    tfoot class: tfoot_class do
      tr do
        th text: "#" if with_index
        footer.each do |value|
          td text: value
        end
      end
    end
  end

  def paginate_partial
    div class: "current-pagination-state text-right pr-2" do
      small do
        plain "showing #{@collection.from}"
        plain "to #{@collection.to}"
        plain "of #{@collection.filtered_count}"
        if (@collection.base_count - @collection.filtered_count) > 0
          plain "(#{@collection.base_count - @collection.filtered_count} hidden by filter)"
        end
      end
    end
    pagination_nav_partial
  end

  def pagination_nav_partial
    nav do
      ul class: ul_classes do
        li class: "page-item #{ 'disabled' if current_page == 1 }" do
          collection_content_previous class: 'page-link' do
            bootstrap_icon name: "chevron-left", size: 10
          end
        end
        @collection.pages.each do |page|
          li class: "page-item #{ 'active' if current_page == page }" do
            collection_content_page_link class: 'page-link', page: page do
              plain page
            end
          end
        end
        li class: "page-item #{ 'disabled' if current_page == last_page }" do
          collection_content_next class: 'page-link' do
            bootstrap_icon name: "chevron-right", size: 10
          end
        end
      end
    end
  end

  def ul_classes
    [].tap do |classes|
      classes << "pagination"
      classes << "justify-content-end"
      classes << "mt-3"
    end.join(' ').strip
  end

  # Custom Table Attributes
  def table_attributes
    html_attributes.merge(
      id: @collection_id,
      class: table_classes
    )
  end

  def current_page
    current_offset = params["#{@collection_id}-offset"].try(:to_i)
    (current_offset/paginate)+1 if current_offset && paginate.present?
  end

  def last_page
    if @collection.filtered_count%paginate == 0
      (@collection.filtered_count/paginate)
    else
      (@collection.filtered_count/paginate)+1
    end
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
