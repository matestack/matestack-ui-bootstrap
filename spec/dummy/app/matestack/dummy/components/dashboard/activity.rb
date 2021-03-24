class Dummy::Components::Dashboard::Activity < ApplicationComponent

  def response
    bs_section_card title: translate("title"), subtitle: translate("subtitle") do
      latest_versions.each do |version|
        version_item_partial(version)
      end
    end
  end

  protected

  def translate key
    t("components.dashboard.activity.#{key}")
  end

  def latest_versions
    PaperTrail::Version.where.not(whodunnit: nil).order(created_at: :desc).limit(10)
  end

  def version_item_partial version
    bs_row class: "mb-3" do
      div class: "col-auto pe-0" do
        if version.whodunnit.present?
          bs_avatar img_path: asset_path('avatar-placeholder.png')
        end
      end
      bs_col do
        heading Admin.find(version.whodunnit).email, size: 6, class: "mb-1"
        small version.event, class: "text-muted mb-0"
        small "#{version.item_type} #{version.item_id}", class: "text-muted mb-0"
        br
        small version.created_at.strftime("%d.%m.%Y %H:%M"), class: "text-muted mb-0"
      end
    end
  end

end
