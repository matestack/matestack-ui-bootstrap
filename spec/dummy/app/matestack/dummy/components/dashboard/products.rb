class Dummy::Components::Dashboard::Products < Matestack::Ui::Component

  def response
    bs_section_card title: translate("title"), subtitle: translate("subtitle") do
      bs_row do
        bs_col xl: 6 do
          text_kpis_partial
        end
        bs_col xl: 6, class: "py-3" do
          chart_kpis_partial
        end
      end
    end
  end

  protected

  def translate key
    t("components.dashboard.products.#{key}")
  end

  def text_kpis_partial
    Dummy::ProductKpiService.top_5_products.each_with_index do |data, index|
      small text: "Top #{index+1}: "
      small do
        transition path: edit_dummy_product_path(Product.find(data[0])), delay: 300 do
          plain "#{Product.find(data[0]).name.truncate(20)} "
        end
      end
      br
    end
  end

  def chart_kpis_partial
    bs_chart type: :doughnut,
      datasets: [
        {
          data: Dummy::ProductKpiService.top_5_product_values,
          backgroundColor: [:primary, :secondary, :blue, :indigo, :info]
        },
      ],
      labels: Dummy::ProductKpiService.top_5_product_names
  end

end
