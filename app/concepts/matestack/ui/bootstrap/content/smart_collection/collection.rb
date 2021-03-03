class Matestack::Ui::Bootstrap::Content::SmartCollection::Collection < Matestack::Ui::Component
  include Matestack::Ui::Core::Collection::Helper
  include Matestack::Ui::Bootstrap::Content::SmartCollection::Content
  include Matestack::Ui::Bootstrap::Content::SmartCollection::Filter
  include Matestack::Ui::Bootstrap::Content::SmartCollection::Paginate

  # html attributes
  optional id: { as: :bs_id }

  # table configuration
  optional :items
  optional :columns
  optional :filters
  optional :footer
  optional :paginate
  optional :rerender_on
  optional :item_actions_proc
  optional :collection_rendering_proc
  optional :slots

  # bootstrap settings
  optional :responsive
  optional :variant
  optional :striped
  optional :hoverable
  optional :border_variant
  optional :borderless

  attr_accessor :processed_filters

  def response
    div id: bs_id, class: "smart-collection" do
      filter_partial
      content
    end
  end


  private

  def collection
    return @collection if @collection
    settings = {}.tap do |h|
      h[:id] = bs_id || "smartcollection"
      h[:data] = filtered_query
      h[:base_count] = items.count
      h[:init_limit] = paginate if paginate
      h[:filtered_count] = filtered_query.count if paginate
    end
    @collection = set_collection(settings)
  end

  def collection_id
    collection.config[:id]
  end

  def filtered_query
    return @filtered_query if @filtered_query
    @filtered_query = items
    unless filters.nil?
      filters.select { |key, value| '.'.in? key.to_s }.each do |key, value|
        associated_name = key.to_s.split(".").first
        @filtered_query = @filtered_query.joins(associated_name.to_sym).all
        if value.is_a?(Hash)
          processed_filters[key] = value
          @filtered_query = add_query_filter(@filtered_query, associated_name, key, value)
        end
      end
      filters.reject { |key, value| '.'.in? key.to_s }.each do |key, value|
        if value.is_a?(Hash)
          processed_filters[key] = value
          @filtered_query = add_query_filter(@filtered_query, nil, key, value)
        end
      end
    end
    @filtered_query
  end

  def add_query_filter(query, associated_name, key, filter_config)
    value = get_collection_filter(collection_id)[key.to_sym]
    if value.present?
      if associated_name.present?
        table_name = items.klass.reflections[associated_name].table_name
        key = key.to_s.gsub(associated_name, table_name)
      else
        table_name = items.klass.table_name
        key = key.to_s
      end
      case filter_config[:match]
      when :equals
        query = query.where("#{key}": value)
      when :starts_with
        query = query.where("lower(#{key}) LIKE ?", "#{value.downcase}%")
      when :ends_with
        query = query.where("lower(#{key}) LIKE ?", "%#{value.downcase}")
      when :like
        query = query.where("lower(#{key}) LIKE ?", "%#{value.downcase}%")
      else
        query = query.where("#{key}": value)
      end
    end
    query
  end

  def head_columns
    columns.map { |key, value| value.is_a?(Hash) ? value[:heading] : value }
  end

  def processed_filters
    @filters ||= {}
  end


end
