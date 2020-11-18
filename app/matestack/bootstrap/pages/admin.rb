class Bootstrap::Pages::Admin < Matestack::Ui::Page

  def page_heading_partial title: "Page title", &block
    section_wrapper do
      div class: "d-flex flex-row justify-content-between" do
        heading size: 2 do
          plain title
        end
        yield if block_given?
      end
    end
  end

  def section_wrapper &block
    section class: "rounded shadow-sm p-4 mb-4" do
      yield if block_given?
    end
  end

end
