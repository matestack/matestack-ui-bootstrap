class Dummy::Components::Dashboard::Activity < Matestack::Ui::Component

  def response
    card title: "Latest activity", class: "shadow-sm mb-3 border-0 h-100" do
      div class: "p-3" do
        latest_versions.each do |version|
          div class: "row mb-2" do
            div class: "col-auto pr-0" do
              div class: "rounded-circle bg-primary text-white text-center p-2", attributes: { style: "height: 40px; width: 40px;"} do
                plain Admin.find(version.whodunnit).email.first.upcase if version.whodunnit.present?
              end
            end
            div class: "col" do
              heading size: 6, class: "mb-1", text: Admin.find(version.whodunnit).email if version.whodunnit.present?
              small class: "text-muted mb-0", text: version.event
              small class: "text-muted mb-0", text: "#{version.item_type} #{version.item_id}"
              br
              small class: "text-muted mb-0", text: version.created_at.strftime("%d.%m.%Y")
            end
          end
        end
      end
    end
  end

  protected

  def latest_versions
    PaperTrail::Version.where('whodunnit IS NOT ?', nil).order(:created_at => :desc).limit(10)
  end

end
