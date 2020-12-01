module Dummy::Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(
    dashboard_revenue: Dummy::Components::Dashboard::Revenue,
    dashboard_products: Dummy::Components::Dashboard::Products,
    dashboard_activity: Dummy::Components::Dashboard::Activity,
  )

  Matestack::Ui::Core::Component::Registry.register_components(
    md: Dummy::Components::Md
  )

end
