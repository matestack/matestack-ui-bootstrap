module Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(

    container: Components::Container,
    row: Components::Row,
    col: Components::Col,
    card: Components::Card,
    btn: Components::Button,
    close: Components::Close,
    btn_group: Components::BtnGroup,
    badge: Components::Badge,
    progress: Components::Progress,
    spinner: Components::Spinner,
    pagination: Components::Pagination,
    navbar: Components::Navbar,
    listgroup: Components::Listgroup,
    modal: Components::Modal,
    # Dynamic Components
    alert: Components::Dynamic::Alert,
    carousel: Components::Dynamic::Carousel,
    collapse: Components::Dynamic::Collapse,
    dropdown: Components::Dynamic::Dropdown,
    toast: Components::Dynamic::Toast,
  )

end