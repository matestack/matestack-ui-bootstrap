class Dummy::Pages::Products::Edit < Matestack::Ui::Page

  include Dummy::Pages::Products::EditCodeRenderingUtils

  include Dummy::Pages::Products::Form

  def product
    Product.find(params[:id])
  end

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    page_heading title: "#{t("products.edit.title")} #{product.name}", subtitle: t("products.edit.subtitle") do
      transition path: dummy_products_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain t("products.edit.back")
        end
      end
    end
    section_card do
      div class: "w-50" do
        product_form_partial form_config
      end
    end
  end

  def form_config
    {
      for: product,
      path: dummy_product_path(id: product.id),
      method: :put,
      delay: 300,
      success: {
        emit: :success,
        transition: {
          path: dummy_products_path
        }
      },
      failure: {
        emit: :failure
      }
    }
  end

end
