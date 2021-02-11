class Matestack::Ui::Bootstrap::Components::SectionCard < Matestack::Ui::Component

  optional :id, :title, :subtitle, :icon, :slots, :content_padding

  def response
    section id: :id, class: "section-card rounded shadow-sm mb-4 bg-white" do
      div class: "d-flex flex-row justify-content-between" do
        if title.present? || subtitle.present?
          div class: "section-card-heading p-4" do
            heading size: 5, class: "mb-0" do
              bs_icon name: icon, size: "35" if icon.present?
              plain title
            end
            small class: "text-muted" do
              plain subtitle
            end
          end
        end
        if slots.present? && slots[:actions].present?
          div class: "section-card-actions p-4" do
            slot slots[:actions]
          end
        end
      end
      div class: "section-card-content #{'p-4' unless content_padding == false} #{'pt-1' if title || subtitle}" do
        yield_components
      end
    end
  end

end
