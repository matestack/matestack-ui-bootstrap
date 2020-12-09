class Bootstrap::Components::PageHeading < Matestack::Ui::Component

  optional :title, :subtitle, :icon

  def response
    section class: "mb-5" do
      row do
        col do
          div class: "page-heading-heading" do
            heading size: 2 do
              bootstrap_icon name: icon, size: "35" if icon.present?
              plain title
            end
            heading size: 6, class: "text-muted" do
              plain subtitle
            end
          end
        end
        col md: 12, xl: 4, class: "text-xl-right mt-3" do
          div class: "page-heading-actions" do
            yield_components
          end
        end
      end
    end
  end

end
