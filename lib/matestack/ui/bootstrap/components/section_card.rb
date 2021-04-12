require_relative "../base_component"

class Matestack::Ui::Bootstrap::Components::SectionCard < Matestack::Ui::Bootstrap::BaseComponent

  optional :id, :title, :subtitle, :icon, :slots, :content_padding

  def response
    section id: context.id, class: "section-card rounded shadow-sm mb-4 bg-white #{options[:class]}" do
      div class: "d-flex flex-row justify-content-between" do
        if context.title.present? || context.subtitle.present?
          div class: "section-card-heading p-4" do
            heading size: 5, class: "mb-0" do
              bs_icon name: context.icon, size: "35" if context.icon.present?
              plain context.title
            end
            small class: "text-muted" do
              plain context.subtitle
            end
          end
        end
        if slots.present? && slots[:actions].present?
          div class: "section-card-actions p-4" do
            slot :actions
          end
        end
      end
      div class: "section-card-content #{'p-4' unless context.content_padding == false} #{'pt-1' if context.title || context.subtitle}" do
        yield if block_given?
      end
    end
  end

end
