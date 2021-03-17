module Matestack::Ui::Bootstrap::Registry

  def heading(text = nil, options, &block)
    case options[:size]
    when 1
      h1(args)
    when 2
      h2(args)
    when 3
      h3(args)
    when 4
      h4(args)
    when 5
      h5(args)
    when 6
      h6(args)
    else
      h1(args)
    end
  end

  COMPONENTS = {
    bs_accordion: Matestack::Ui::Bootstrap::Components::Accordion,
    bs_alert: Matestack::Ui::Bootstrap::Components::Alert,
    bs_avatar: Matestack::Ui::Bootstrap::Components::Avatar,
    bs_badge: Matestack::Ui::Bootstrap::Components::Badge,
    bs_breadcrumb: Matestack::Ui::Bootstrap::Components::Breadcrumb,
    bs_btn: Matestack::Ui::Bootstrap::Components::Button,
    bs_btn_group: Matestack::Ui::Bootstrap::Components::ButtonGroup,
    bs_card: Matestack::Ui::Bootstrap::Components::Card,
    bs_carousel: Matestack::Ui::Bootstrap::Components::Carousel,
    bs_close: Matestack::Ui::Bootstrap::Components::Close,
    bs_collapse: Matestack::Ui::Bootstrap::Components::Collapse,
    bs_dropdown: Matestack::Ui::Bootstrap::Components::Dropdown,
    bs_icon: Matestack::Ui::Bootstrap::Components::Icon,
    bs_list_group: Matestack::Ui::Bootstrap::Components::ListGroup,
    bs_modal: Matestack::Ui::Bootstrap::Components::Modal,
    bs_navbar: Matestack::Ui::Bootstrap::Components::Navbar,
    bs_pagination: Matestack::Ui::Bootstrap::Components::Pagination,
    bs_page_heading: Matestack::Ui::Bootstrap::Components::PageHeading,
    bs_popover: Matestack::Ui::Bootstrap::Components::Popover,
    bs_progress: Matestack::Ui::Bootstrap::Components::Progress,
    bs_scrollspy: Matestack::Ui::Bootstrap::Components::Scrollspy,
    bs_section_card: Matestack::Ui::Bootstrap::Components::SectionCard,
    bs_spinner: Matestack::Ui::Bootstrap::Components::Spinner,
    bs_tab_nav: Matestack::Ui::Bootstrap::Components::TabNav,
    bs_tab_nav_content: Matestack::Ui::Bootstrap::Components::TabNavContent,
    bs_toast: Matestack::Ui::Bootstrap::Components::Toast,
    bs_tooltip: Matestack::Ui::Bootstrap::Components::Tooltip,
  }

  FORMS = {
    bs_form_input: Matestack::Ui::Bootstrap::Form::Input,
    bs_form_select: Matestack::Ui::Bootstrap::Form::Select,
    bs_form_checkbox: Matestack::Ui::Bootstrap::Form::Checkbox,
    bs_form_radio: Matestack::Ui::Bootstrap::Form::Radio,
    bs_form_switch: Matestack::Ui::Bootstrap::Form::Switch,
    bs_form_submit: Matestack::Ui::Bootstrap::Form::Submit
  }

  CONTENT = {
    bs_figure: Matestack::Ui::Bootstrap::Content::Figure,
    bs_smart_collection: Matestack::Ui::Bootstrap::Content::SmartCollection::Collection,
  }

  LAYOUTS = {
    bs_col: Matestack::Ui::Bootstrap::Layout::Column,
    bs_container: Matestack::Ui::Bootstrap::Layout::Container,
    bs_row: Matestack::Ui::Bootstrap::Layout::Row,
    bs_sidebar: Matestack::Ui::Bootstrap::Layout::Sidebar
  }

  Matestack::Ui::Core::Component::Registry.register_components(
    **COMPONENTS,
    **FORMS,
    **CONTENT,
    **LAYOUTS
  )

end
