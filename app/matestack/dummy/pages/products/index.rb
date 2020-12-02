class Dummy::Pages::Products::Index < Matestack::Ui::Page

  include Dummy::Pages::Products::IndexCodeRenderingUtils

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    page_heading title: t("products.index.title"), subtitle: t("products.index.subtitle").html_safe do
      transition path: new_dummy_product_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "plus"
          plain t("products.index.add_product")
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
      base_query: Product.all, # ActiveRecord query, could be something different than .all
      columns: [ :id, :name, :price_in_euro ], # which columns should be shown?
      filters: filters, # optional: which filters should appear?
      paginate: 10, # optional: how many items should be shown per page?
      row_actions: row_actions, # optional: what actions should be possible per row?
      rerender_on: "success"
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
        path: :edit_dummy_product_path,
        params: { id: :id },
        delay: 300
      },
      {
        type: :action,
        icon: "trash2",
        btn_variant: :danger,
        method: :delete,
        path: :dummy_product_path,
        params: { id: :id },
        confirm: true,
        success: {
          emit: "success"
        }
      },
    ]
  end

end
