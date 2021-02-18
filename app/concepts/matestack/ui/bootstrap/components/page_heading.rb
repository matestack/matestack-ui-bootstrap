class Matestack::Ui::Bootstrap::Components::PageHeading < Matestack::Ui::Component

  optional :title, :subtitle, :icon

  def response
    section class: "mb-5" do
      bs_row do
        bs_col do
          div class: "page-heading-heading" do
            heading size: 2 do
              bs_icon name: icon, size: "35" if icon.present?
              plain title
            end
            heading size: 6, class: "text-muted" do
              plain subtitle
            end
          end
        end
        bs_col md: 12, xl: 4, class: "text-xl-end mt-3" do
          div class: "page-heading-actions text-xl-end" do
            yield_components
          end
        end
      end
    end
  end

end
