class Dummy::Pages::Customers::Index < Matestack::Ui::Page

  include Dummy::Pages::Customers::IndexCodeRenderingUtils

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: t("customers.index.title"), subtitle: t("customers.index.subtitle") do
      transition path: new_dummy_customer_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "person-plus"
          plain t("customers.index.add_customer")
        end
      end
    end
    async defer: true, id: "list" do
      bs_section_card title: t("customers.index.collection.title"), subtitle: t("customers.index.collection.subtitle").html_safe do
        bs_smart_collection collection_config
      end
    end
  end

  def collection_config
    {
      id: 'customers',
      items: Customer.all,
      paginate: 10,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name",
        street: "Street",
        house_number: "House Number",
        postal_code: "Postal Code",
        city: "City"
      },
      filters: {
        last_name: {
          placeholder: 'Filter by Last Name',
          match: :like,
        }
      },
      slots: {
        table_item_actions: method(:table_item_actions)
      }
    }
  end

  def table_item_actions customer
    slot do
      transition path: edit_dummy_customer_path(customer), delay: 300 do
        bs_btn outline: true, size: :sm, variant: :primary, class: "m-1" do
          bs_icon name: 'arrow-right', size: 20
        end
      end
      action customer_delete_action_config(customer) do
        bs_btn outline: true, size: :sm, variant: :danger, class: "m-1" do
          bs_icon name: 'trash2', size: 20
        end
      end
    end
  end

  def customer_delete_action_config customer
    {
      method: :delete,
      path: dummy_customer_path(id: customer.id),
      confirm: true,
      success: {
        emit: "success"
      }
    }
  end

end
