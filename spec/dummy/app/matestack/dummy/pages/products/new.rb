class Dummy::Pages::Products::New < Matestack::Ui::Page

  include Dummy::Pages::Products::NewCodeRenderingUtils

  include Dummy::Pages::Products::Form

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: t("products.new.title"), subtitle: t("products.new.subtitle") do
      transition path: dummy_products_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "chevron-left"
          plain t("products.new.back")
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
      for: Product.new,
      path: dummy_products_path,
      method: :post,
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
