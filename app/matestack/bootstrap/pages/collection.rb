class Bootstrap::Pages::Collection < Matestack::Ui::Page

  def response
    smart_table table_config
  end

  def table_config
    {
      base_query: Person.all, # ActiveRecord query, could be something different than .all
      columns: [ :name, :email, :age ], # which columns should be shown?
      filters: filters, # optional: which filters should appear?
      paginate: 5, # optional: how many items should be shown per page?
      row_actions: row_actions # optional: what actions should be possible per row?
    }
  end

  def filters
    [
      {
        column: :name,
        type: :input,
        match: :like,
        placeholder: "Search by name"
      }
    ]
  end

  def row_actions
    # configure what actions should appear per row as buttons with text or icons
    # pass in path as symbol, as it will be resolved within the smart_table component
    # for each iteration, calling the "id" of the instance of the current iteration
    [
      {
        type: :transition,
        icon: "arrow-right",
        btn_variant: :primary,
        path: :form_test_path,
        params: { id: :id }
      },
      {
        type: :action,
        icon: "trash2",
        btn_variant: :danger,
        method: :post,
        path: :form_test_path,
        params: { id: :id },
        confirm: true
      },
    ]
  end

end
