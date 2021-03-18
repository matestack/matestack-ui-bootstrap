class Dummy::Pages::Products::Edit < ApplicationPage

  include Dummy::Pages::Products::EditCodeRenderingUtils

  include Dummy::Pages::Products::Form

  def product
    Product.find(params[:id])
  end

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: "#{t("products.edit.title")} #{product.name}", subtitle: t("products.edit.subtitle") do
      transition path: dummy_products_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "chevron-left"
          plain t("products.edit.back")
        end
      end
    end

    bs_section_card do
      bs_row do
        bs_col xl: 6 do
          product_form_partial form_config
        end
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
