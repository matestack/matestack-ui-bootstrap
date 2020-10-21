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

    filtered_query = base_query

    # Core Collection
    @collection = set_collection(
      id: @collection_id,
      data: base_query
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
        th attributes: { 'scope': 'col' }, text: "Name"
        th attributes: { 'scope': 'col' }, text: "Age"
        th attributes: { 'scope': 'col' }, text: "E-Mail"
      end
    end
  end

  def table_body_partial
    tbody do
      async id: bs_id, rerender_on: "#{@collection_id}-update" do
        collection_content @collection.config do
          @collection.paginated_data.each do |data|
            tr do
              # th attributes: { 'scope': 'row' }, text: "1"
              td text: data.name 
              td text: data.age 
              td text: data.email
            end
          end
        end
      end
    end
  end

  def table_footer_partial
    tfoot do
      tr do
        # th text: "Footer"
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