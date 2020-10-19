class Bootstrap::Content::Table < Matestack::Ui::Component
  include Matestack::Ui::Core::Collection::Helper

  optional class: { as: :bs_class }, id: { as: :bs_id }
  # Smart Table Attributes
  optional :include, :filter, :base_query, :page, :order

  # Bootstrap Table Attributes
  optional :variants

  def prepare
    @collection_id = bs_id ||= "smart-table"
    # model = base_query.model
    # model_name = model.model_name

    my_base_query = base_query
    # my_filtered_query = my_base_query

    # Core Collection
    @collection = set_collection(
      id: @collection_id,
      data: my_base_query
    )
  end

  def response
    # automatically generated table for a given array, hash or collection
    # needs to be evaluated how you would pass in a collection and attributes you want to display
    table table_attributes do
      table_head_partial
      table_body_partial
      table_footer_partial
    end
  end

  protected
  
  def table_head_partial
    thead do
      tr do
        th attributes: { 'scope': 'col' }, text: "#"
        th attributes: { 'scope': 'col' }, text: "First"
        th attributes: { 'scope': 'col' }, text: "Last"
        th attributes: { 'scope': 'col' }, text: "Handle"
      end
    end
  end

  def table_body_partial
    tbody do
      tr do
        th attributes: { 'scope': 'row' }, text: "1"
        td text: "Mark"
        td text: "Otto"
        td text: "@mdo"
      end
      tr do
        th attributes: { 'scope': 'row' }, text: "2"
        td text: "Mark"
        td text: "Otto"
        td text: "@mdo"
      end
      tr do
        th attributes: { 'scope': 'row' }, text: "3"
        td text: "Mark"
        td text: "Otto"
        td text: "@mdo"
      end
    end
  end

  def table_footer_partial
    tfoot do
      tr do
        th text: "Footer"
        td text: "Footer"
        td text: "Footer"
        td text: "@Footer"
      end
    end
  end

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