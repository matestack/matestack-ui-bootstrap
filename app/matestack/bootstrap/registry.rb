module Bootstrap::Registry

  COMPONENTS = {
    alert: Bootstrap::Components::Alert,
    badge: Bootstrap::Components::Badge,
    breadcrumb: Bootstrap::Components::Breadcrumb,
    btn: Bootstrap::Components::Button,
    btn_group: Bootstrap::Components::ButtonGroup,
    card: Bootstrap::Components::Card,
    carousel: Bootstrap::Components::Carousel,
    close: Bootstrap::Components::Close,
    collapse: Bootstrap::Components::Collapse,
    dropdown: Bootstrap::Components::Dropdown,
    list_group: Bootstrap::Components::ListGroup,
    modal: Bootstrap::Components::Modal,
    navigation: Bootstrap::Components::Nav,
    navbar: Bootstrap::Components::Navbar,
    pagination: Bootstrap::Components::Pagination,
    popover: Bootstrap::Components::Popover,
    progress: Bootstrap::Components::Progress,
    scrollspy: Bootstrap::Components::Scrollspy,
    spinner: Bootstrap::Components::Spinner,
    toast: Bootstrap::Components::Toast,
    tooltip: Bootstrap::Components::Tooltip,
  }

  FORMS = {
    bootstrap_checkbox: Bootstrap::Form::Checkbox
  }

  CONTENT = {
    figure: Bootstrap::Content::Figure,
    table: Bootstrap::Content::Table,
  }

  LAYOUTS = {
    col: Bootstrap::Layout::Column,
    container: Bootstrap::Layout::Container,
    row: Bootstrap::Layout::Row,
  }

  Matestack::Ui::Core::Component::Registry.register_components(
    **COMPONENTS,
    **FORMS,
    **LAYOUTS
  )

end