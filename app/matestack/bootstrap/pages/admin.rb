class Bootstrap::Pages::Admin < Matestack::Ui::Page

  def page_heading_partial title: "Page title", subtitle: "", &block
    section class: "mb-5" do
      div class: "d-flex flex-row justify-content-between" do
        div class: "page-heading-heading" do
          heading size: 2 do
            plain title
          end
          heading size: 6, class: "text-muted" do
            plain subtitle
          end
        end
        div class: "page-heading-actions" do
          yield if block_given?
        end
      end
    end
  end

  def section_wrapper &block
    section class: "rounded shadow-sm p-4 mb-4 bg-white" do
      yield if block_given?
    end
  end

end
