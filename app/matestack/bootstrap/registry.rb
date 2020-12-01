module Bootstrap::Registry

  COMPONENTS = {
    accordion: Bootstrap::Components::Accordion,
    alert: Bootstrap::Components::Alert,
    avatar: Bootstrap::Components::Avatar,
    badge: Bootstrap::Components::Badge,
    breadcrumb: Bootstrap::Components::Breadcrumb,
    btn: Bootstrap::Components::Button,
    btn_group: Bootstrap::Components::ButtonGroup,
    card: Bootstrap::Components::Card,
    carousel: Bootstrap::Components::Carousel,
    chart: Bootstrap::Components::Chart,
    close: Bootstrap::Components::Close,
    collapse: Bootstrap::Components::Collapse,
    dropdown: Bootstrap::Components::Dropdown,
    bootstrap_icon: Bootstrap::Components::Icon,
    list_group: Bootstrap::Components::ListGroup,
    modal: Bootstrap::Components::Modal,
    navbar: Bootstrap::Components::Navbar,
    pagination: Bootstrap::Components::Pagination,
    page_heading: Bootstrap::Components::PageHeading,
    popover: Bootstrap::Components::Popover,
    progress: Bootstrap::Components::Progress,
    scrollspy: Bootstrap::Components::Scrollspy,
    section_card: Bootstrap::Components::SectionCard,
    spinner: Bootstrap::Components::Spinner,
    tab_nav: Bootstrap::Components::TabNav,
    tab_nav_content: Bootstrap::Components::TabNavContent,
    toast: Bootstrap::Components::Toast,
    tooltip: Bootstrap::Components::Tooltip,
  }

  FORMS = {
    bootstrap_input: Bootstrap::Form::Input,
    bootstrap_select: Bootstrap::Form::Select,
    bootstrap_checkbox: Bootstrap::Form::Checkbox,
    bootstrap_radio: Bootstrap::Form::Radio,
    bootstrap_switch: Bootstrap::Form::Switch,
    bootstrap_submit: Bootstrap::Form::Submit,
    bootstrap_date: Bootstrap::Form::Date,
  }

  CONTENT = {
    figure: Bootstrap::Content::Figure,
    smart_table: Bootstrap::Content::Table,
  }

  LAYOUTS = {
    col: Bootstrap::Layout::Column,
    container: Bootstrap::Layout::Container,
    row: Bootstrap::Layout::Row,
    sidebar: Bootstrap::Layout::Sidebar
  }

  Matestack::Ui::Core::Component::Registry.register_components(
    **COMPONENTS,
    **FORMS,
    **CONTENT,
    **LAYOUTS
  )

end
