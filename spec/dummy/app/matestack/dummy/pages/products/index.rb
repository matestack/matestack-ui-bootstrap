class Dummy::Pages::Products::Index < Matestack::Ui::Page

  include Dummy::Pages::Products::IndexCodeRenderingUtils

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: t("products.index.title"), subtitle: t("products.index.subtitle").html_safe do
      transition path: new_dummy_product_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "plus"
          plain t("products.index.add_product")
        end
      end
    end
    async defer: true, id: "list" do
      bs_section_card title: t("products.index.collection.title"), subtitle: t("products.index.collection.subtitle").html_safe do
        bs_smart_collection collection_config
      end
    end
  end

  def collection_config
    {
      id: 'products',
      items: Product.all,
      paginate: 15,
      rerender_on: "success",
      filters: {
        name: {
          placeholder: 'Filter by Name',
          match: :like
        },
      },
      slots: {
        collection_rendering: method(:collection_rendering)
      }
    }
  end

  def collection_rendering products
    slot do
      bs_row do
        products.each do |product|
          bs_col xl: 4, class: "mb-3" do
            collection_card product
          end
        end
      end
    end
  end

  def collection_card product
    bs_card title: product.name, subtitle: "#{product.price_in_euro} €", class: "h-100" do
      paragraph class: "fw-lighter", text: product.description
      transition path: edit_dummy_product_path(product), delay: 300 do
        bs_btn outline: true, size: :sm, variant: :primary do
          bs_icon name: 'arrow-right', size: 20
        end
      end
      action product_delete_action_config(product) do
        bs_btn outline: true, size: :sm, variant: :danger do
          bs_icon name: 'trash2', size: 20
        end
      end
    end
  end

  def product_delete_action_config product
    {
      method: :delete,
      path: dummy_product_path(id: product.id),
      confirm: true,
      success: {
        emit: "success"
      }
    }
  end

end
