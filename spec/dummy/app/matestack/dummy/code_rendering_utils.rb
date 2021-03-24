module Dummy::CodeRenderingUtils

  def render_code path, title
    bs_section_card title: title, subtitle: path, content_padding: false do
      md path: path, lang: "ruby"
    end
  end

  def render_code_grid items, id
    async defer: true, id: id do
      bs_row do
        bs_col align_self: :start, xl: 8 do
          items.each do |code_snippet|
            render_code code_snippet[:path], code_snippet[:title]
          end
        end
      end
    end
  end

  def render_dummy_and_code_in_tabs
    bs_tab_nav tab_nav_config do
      bs_tab_nav_content id: :dummy, active: true do
        dummy_tab_content
      end
      bs_tab_nav_content id: :matestack_implementation do
        matestack_implementation_partial
      end
      bs_tab_nav_content id: :rails_integration do
        rails_integration_partial
      end
      bs_tab_nav_content id: :javascript_implementation do
        javascript_implementation_partial
      end
      bs_tab_nav_content id: :css_implementation do
        css_implementation_partial
      end
    end
  end

  def tab_nav_config
    {
      id: "navigation",
      items: [
        { id: :dummy, text: "Dummy", active: true},
        { id: :matestack_implementation, text: "Matestack Implementation" },
        { id: :rails_integration, text: "Rails Integration" },
        { id: :javascript_implementation, text: "Required JavaScript" },
        { id: :css_implementation, text: "Required CSS" },
      ],
      variant: :pills,
      vertical_up_to_xl: true,
      class: "mb-5"
    }
  end

  def javascript_implementation_partial
    bs_row do
      bs_col class: "ps-4" do
        b "None!"
      end
    end
  end

  def css_implementation_partial
    bs_row do
      bs_col class: "ps-4" do
        b "None!"
      end
    end
  end

end
