require 'rails_helper'

RSpec.describe "Bootstrap::Components::TabNav", type: :feature, js: true do
  include Utils

  it 'renders tab nav with pills' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end

    visit example_path

    expect(page).to have_selector('ul.nav.nav-pills > li.nav-item > a.nav-link.active', text: "Tab A")
    expect(page).to have_selector('ul.nav.nav-pills > li.nav-item > a.nav-link', text: "Tab B")
    expect(page).to have_selector('.tab-content > #tab-a-content.tab-pane.fade.active.show', text: "A")
    expect(page).to have_selector('.tab-content > #tab-b-content.tab-pane.fade', text: "B", visible: false)

    click_on "Tab B"

    expect(page).to have_selector('ul.nav.nav-pills > li.nav-item > a.nav-link', text: "Tab A")
    expect(page).to have_selector('ul.nav.nav-pills > li.nav-item > a.nav-link.active', text: "Tab B")
    expect(page).to have_selector('.tab-content > #tab-a-content.tab-pane.fade', text: "A", visible: false)
    expect(page).to have_selector('.tab-content > #tab-b-content.tab-pane.fade.active.show', text: "B")

    click_on "Tab A"

    expect(page).to have_selector('ul.nav.nav-pills > li.nav-item > a.nav-link.active', text: "Tab A")
    expect(page).to have_selector('ul.nav.nav-pills > li.nav-item > a.nav-link', text: "Tab B")
    expect(page).to have_selector('.tab-content > #tab-a-content.tab-pane.fade.active.show', text: "A")
    expect(page).to have_selector('.tab-content > #tab-b-content.tab-pane.fade', text: "B", visible: false)
  end

  it 'renders tab nav with tabs' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :tabs
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end

    visit example_path

    expect(page).to have_selector('ul.nav.nav-tabs > li.nav-item > a.nav-link.active', text: "Tab A")
    expect(page).to have_selector('ul.nav.nav-tabs > li.nav-item > a.nav-link', text: "Tab B")
    expect(page).to have_selector('.tab-content > #tab-a-content.tab-pane.fade.active.show', text: "A")
    expect(page).to have_selector('.tab-content > #tab-b-content.tab-pane.fade', text: "B", visible: false)

    click_on "Tab B"

    expect(page).to have_selector('ul.nav.nav-tabs > li.nav-item > a.nav-link', text: "Tab A")
    expect(page).to have_selector('ul.nav.nav-tabs > li.nav-item > a.nav-link.active', text: "Tab B")
    expect(page).to have_selector('.tab-content > #tab-a-content.tab-pane.fade', text: "A", visible: false)
    expect(page).to have_selector('.tab-content > #tab-b-content.tab-pane.fade.active.show', text: "B")

    click_on "Tab A"

    expect(page).to have_selector('ul.nav.nav-tabs > li.nav-item > a.nav-link.active', text: "Tab A")
    expect(page).to have_selector('ul.nav.nav-tabs > li.nav-item > a.nav-link', text: "Tab B")
    expect(page).to have_selector('.tab-content > #tab-a-content.tab-pane.fade.active.show', text: "A")
    expect(page).to have_selector('.tab-content > #tab-b-content.tab-pane.fade', text: "B", visible: false)
  end


  it 'can align horizontally' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      horizontal: :center
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.justify-content-center')
  end

  it 'can stack vertically' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      vertical: true
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.flex-column')
  end

  it 'has elements with equals width' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      justified: true
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.nav-justified')
  end

  it 'has elements that proportionately fill all available space' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      fill: true
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.nav-fill')
  end

  it 'can have custom class' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      class: "foobar"
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.foobar')
  end

  it 'can be set to vertical_up_to_sm' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      vertical_up_to_sm: true
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.flex-column.flex-sm-column.flex-md-row')
  end

  it 'can be set to vertical_up_to_md' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      vertical_up_to_md: true
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.flex-column.flex-sm-column.flex-md-column.flex-lg-row')
  end

  it 'can be set to vertical_up_to_xl' do
    tab_nav_config = {
      id: "navigation",
      items: [
        { id: :a, text: "Tab A", active: true},
        { id: :b, text: "Tab B" }
      ],
      variant: :pills,
      vertical_up_to_xl: true
    }
    matestack_render do
      bs_tab_nav tab_nav_config do
        bs_tab_nav_content id: :a, active: true do
          plain "A"
        end
        bs_tab_nav_content id: :b do
          plain "B"
        end
      end
    end
    visit example_path
    expect(page).to have_selector('ul.nav.flex-column.flex-sm-column.flex-md-column.flex-lg-column.flex-xl-row')
  end

end
