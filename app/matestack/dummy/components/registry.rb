module Dummy::Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(
    dashboard_revenue: Dummy::Components::Dashboard::Revenue,
    dashboard_customers: Dummy::Components::Dashboard::Customers,
    dashboard_orders: Dummy::Components::Dashboard::Orders,
    dashboard_activity: Dummy::Components::Dashboard::Activity,
  )

end
