class Bootstrap::Content::Table::Table < Matestack::Ui::Component
  include Matestack::Ui::Core::Collection::Helper
  include Bootstrap::Content::Table::Content
  include Bootstrap::Content::Table::Filter

  # html attributes
  optional id: { as: :bs_id }

  # table configuration
  optional :items
  optional :columns
  optional :footer
  optional :paginate
  optional :item_actions

  # bootstrap settings
  optional :responsive
  optional :variant
  optional :striped
  optional :hoverable
  optional :border_variant
  optional :borderless

  attr_accessor :filters

  def response
    filter_partial
    content
  end


  private

  def collection
    return @collection if @collection
    settings = {}.tap do |h|
      h[:id] = bs_id || "smarttable"
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
    columns.select { |key, value| '.'.in? key.to_s }.each do |key, value|
      associated_name = key.to_s.split(".").first
      # associated_name = key.to_s.split(".")[0..-2].reverse.inject { |a, n| { n.to_sym => a.to_sym } }
      # associated_name = associated_name.to_sym if associated_name.is_a? String
      @filtered_query = @filtered_query.joins(associated_name.to_sym).all
      if value.is_a?(Hash) && filter_config = value[:filter]
        filters[key] = filter_config
        @filtered_query = add_query_filter(@filtered_query, associated_name, key, filter_config)
      end
    end
    @filtered_query
  end

  def add_query_filter(query, associated_name, key, filter_config)
    value = get_collection_filter(collection_id)[key.to_sym]
    if value.present?
      table_name = items.klass.reflections[associated_name].table_name
      key = key.to_s.gsub(associated_name, table_name)
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

  def filters
    @filters ||= {}
  end


end