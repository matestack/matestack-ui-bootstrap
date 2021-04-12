class Dummy::Components::Dashboard::Revenue < ApplicationComponent

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
    t("components.dashboard.revenue.#{key}")
  end

  def kpis
    [:four_weeks_ago, :three_weeks_ago, :two_weeks_ago, :last_7_days]
  end

  def text_kpis_partial
    b "#{translate("total")}:"
    plain "#{Dummy::RevenueKpiService.total} €"
    br
    br
    kpis.each do |kpi|
      small "#{translate(kpi)}: "
      small "#{Dummy::RevenueKpiService.send(kpi)} €"
      br
    end
  end

  def chart_kpis_partial
    chart_js type: :line,
      datasets: [
        {
          label: "€",
          data: kpis.map { |kpi| Dummy::RevenueKpiService.send(kpi) },
          borderColor: :primary,
          pointRadius: 0
        },
      ],
      labels: kpis.map { |kpi| translate(kpi) },
      display_x_axes: false,
      display_y_axes: false
  end


end
