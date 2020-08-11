module Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(

    container: Components::Container,
    row: Components::Row,
    col: Components::Col,
    card: Components::Card,
    btn: Components::Btn,
    close: Components::Close,
    btn_group: Components::BtnGroup,
    badge: Components::Badge,
    progress: Components::Progress,
    spinner: Components::Spinner,
    pagination: Components::Pagination,
  )

end