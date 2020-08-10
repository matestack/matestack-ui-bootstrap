module Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(

    container: Components::Container,
    row: Components::Row,
    col: Components::Col,
    card: Components::Card,
    btn: Components::Btn
  )

end