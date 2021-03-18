module Matestack::Ui::Bootstrap::Registry

  def heading(text = nil, options=nil, &block)
    if text.is_a?(Hash)
      options = text
    end

    case options[:size]
    when 1
      h1(text, options, &block)
    when 2
      h2(text, options, &block)
    when 3
      h3(text, options, &block)
    when 4
      h4(text, options, &block)
    when 5
      h5(text, options, &block)
    when 6
      h6(text, options, &block)
    else
      h1(text, options, &block)
    end
  end

  def bs_accordion(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Accordion.(text, options, &block)
  end

  def bs_alert(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Alert.(text, options, &block)
  end

  def bs_avatar(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Avatar.(text, options, &block)
  end

  def bs_badge(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Badge.(text, options, &block)
  end

  def bs_breadcrumb(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Breadcrumb.(text, options, &block)
  end

  def bs_btn(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Button.(text, options, &block)
  end

  def bs_btn_group(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::ButtonGroup.(text, options, &block)
  end

  def bs_card(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Card.(text, options, &block)
  end

  def bs_carousel(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Carousel.(text, options, &block)
  end

  def bs_close(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Close.(text, options, &block)
  end

  def bs_collapse(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Collapse.(text, options, &block)
  end

  def bs_dropdown(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Dropdown.(text, options, &block)
  end

  def bs_icon(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Icon.(text, options, &block)
  end

  def bs_list_group(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::ListGroup.(text, options, &block)
  end

  def bs_modal(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Modal.(text, options, &block)
  end

  def bs_navbar(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Navbar.(text, options, &block)
  end

  def bs_pagination(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Pagination.(text, options, &block)
  end

  def bs_page_heading(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::PageHeading.(text, options, &block)
  end

  def bs_popover(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Popover.(text, options, &block)
  end

  def bs_progress(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Progress.(text, options, &block)
  end

  def bs_scrollspy(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Scrollspy.(text, options, &block)
  end

  def bs_section_card(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::SectionCard.(text, options, &block)
  end

  def bs_spinner(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Spinner.(text, options, &block)
  end

  def bs_tab_nav(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::TabNav.(text, options, &block)
  end

  def bs_tab_nav_content(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::TabNavContent.(text, options, &block)
  end

  def bs_toast(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Toast.(text, options, &block)
  end

  def bs_tooltip(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Components::Tooltip.(text, options, &block)
  end



  def bs_form_input(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Form::Input.(text, options, &block)
  end

  def bs_form_select(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Form::Select.(text, options, &block)
  end

  def bs_form_checkbox(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Form::Checkbox.(text, options, &block)
  end

  def bs_form_radio(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Form::Radio.(text, options, &block)
  end

  def bs_form_switch(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Form::Switch.(text, options, &block)
  end

  def bs_form_submit(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Form::Submit.(text, options, &block)
  end




  def bs_figure(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Content::Figure.(text, options, &block)
  end

  def bs_smart_collection(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Content::SmartCollection::Collection.(text, options, &block)
  end




  def bs_col(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Layout::Column.(text, options, &block)
  end

  def bs_container(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Layout::Container.(text, options, &block)
  end

  def bs_row(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Layout::Row.(text, options, &block)
  end

  def bs_sidebar(text=nil, options=nil, &block)
    Matestack::Ui::Bootstrap::Layout::Sidebar.(text, options, &block)
  end



end
