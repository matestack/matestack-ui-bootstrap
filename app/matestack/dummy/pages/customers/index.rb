class Dummy::Pages::Customers::Index < Bootstrap::Pages::Admin

  include Dummy::Pages::Customers::IndexCodeRenderingUtils

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    page_heading title: "Customers" do
      transition path: new_dummy_customer_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "person-plus"
          plain "New customer"
        end
      end
    end
    async defer: true, id: "list" do
      section_card do
        smart_table table_config
      end
    end
  end

  def table_config
    {
      base_query: Customer.all, # ActiveRecord query, could be something different than .all
      columns: [ :id, :first_name, :last_name, :street, :house_number, :postal_code, :city,], # which columns should be shown?
      filters: filters, # optional: which filters should appear?
      paginate: 10, # optional: how many items should be shown per page?
      row_actions: row_actions, # optional: what actions should be possible per row?
      rerender_on: "success"
    }
  end

  def filters
    [
      {
        column: :last_name,
        type: :input,
        match: :like,
        placeholder: "Search by last name"
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
        path: :edit_dummy_customer_path,
        params: { id: :id },
        delay: 300
      },
      {
        type: :action,
        icon: "trash2",
        btn_variant: :danger,
        method: :delete,
        path: :dummy_customer_path,
        params: { id: :id },
        confirm: true,
        success: {
          emit: "success"
        }
      },
    ]
  end

end
