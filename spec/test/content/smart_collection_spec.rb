require 'rails_helper'

RSpec.describe "Bootstrap::Content::SmartCollection", type: :feature, js: true do
  include Utils

  before :all do
    Customer.destroy_all
    20.times do |i|
      Customer.create!(
        first_name: "first_name #{i}",
        last_name: "last_name #{i}",
        email: "email_#{i}@example.com",
        street: "street #{i}",
        house_number: "house_number #{i}",
        postal_code: "#{i}",
        city:"city #{i}"
      )
    end
  end

  it 'ActiveRecord collection rendered as plain table' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.all,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name"
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path

    expect(page).to have_selector('table.table.table-hover[id="customer-collection"]')
    expect(page).to have_selector('th[scope="col"]', text: "ID")
    expect(page).to have_selector('th[scope="col"]', text: "First Name")
    expect(page).to have_selector('th[scope="col"]', text: "Last Name")

    expect(page).to have_selector('tr.align-middle', count: 20)

    expect(page).not_to have_selector('.current-pagination-state')
    expect(page).not_to have_selector('.smart-collection-filter')
  end

  it 'customizable ActiveRecord collection rendered as plain table' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.where(first_name: "first_name 1"),
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name"
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path

    expect(page).to have_selector('table.table.table-hover[id="customer-collection"]')
    expect(page).to have_selector('th[scope="col"]', text: "ID")
    expect(page).to have_selector('th[scope="col"]', text: "First Name")
    expect(page).to have_selector('th[scope="col"]', text: "Last Name")

    expect(page).to have_selector('tr.align-middle', count: 1)

    expect(page).not_to have_selector('.current-pagination-state')
    expect(page).not_to have_selector('.smart-collection-filter')
  end

  it 'paginated ActiveRecord collection rendered as table without any actions' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.all,
      paginate: 10,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name"
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path

    expect(page).to have_selector('table.table.table-hover[id="customer-collection"]')
    expect(page).to have_selector('th[scope="col"]', text: "ID")
    expect(page).to have_selector('th[scope="col"]', text: "First Name")
    expect(page).to have_selector('th[scope="col"]', text: "Last Name")

    expect(page).to have_selector('tr.align-middle', count: 10)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 1 to 10 of 20")

    within('nav.table-responsive > ul.pagination.justify-content-end.mt-3') do
      expect(page).to have_selector('li.page-item.previous.disabled > a.page-link > svg')
      expect(page).to have_selector('li.page-item.active > a.page-link', text: "1")
      expect(page).to have_selector('li.page-item > a.page-link', text: "2")
      expect(page).to have_selector('li.page-item.next > a.page-link > svg')
    end

    find("li.page-item.next").click

    expect(page).to have_selector('tr.align-middle', count: 10)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 11 to 20 of 20")

    within('nav.table-responsive > ul.pagination.justify-content-end.mt-3') do
      expect(page).to have_selector('li.page-item.previous > a.page-link > svg')
      expect(page).to have_selector('li.page-item > a.page-link', text: "1")
      expect(page).to have_selector('li.page-item.active > a.page-link', text: "2")
      expect(page).to have_selector('li.page-item.next.disabled > a.page-link > svg')
    end

    expect(page).not_to have_selector('.smart-collection-filter')
  end

  it 'paginated, customizable ActiveRecord collection rendered as table without any actions' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.where("(postal_code)::int > ?", 10),
      paginate: 5,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name"
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path

    expect(page).to have_selector('table.table.table-hover[id="customer-collection"]')
    expect(page).to have_selector('th[scope="col"]', text: "ID")
    expect(page).to have_selector('th[scope="col"]', text: "First Name")
    expect(page).to have_selector('th[scope="col"]', text: "Last Name")

    expect(page).to have_selector('tr.align-middle', count: 5)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 1 to 5 of 9")

    within('nav.table-responsive > ul.pagination.justify-content-end.mt-3') do
      expect(page).to have_selector('li.page-item.previous.disabled > a.page-link > svg')
      expect(page).to have_selector('li.page-item.active > a.page-link', text: "1")
      expect(page).to have_selector('li.page-item > a.page-link', text: "2")
      expect(page).to have_selector('li.page-item.next > a.page-link > svg')
    end

    find("li.page-item.next").click

    expect(page).to have_selector('tr.align-middle', count: 4)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 6 to 9 of 9")

    within('nav.table-responsive > ul.pagination.justify-content-end.mt-3') do
      expect(page).to have_selector('li.page-item.previous > a.page-link > svg')
      expect(page).to have_selector('li.page-item > a.page-link', text: "1")
      expect(page).to have_selector('li.page-item.active > a.page-link', text: "2")
      expect(page).to have_selector('li.page-item.next.disabled > a.page-link > svg')
    end

    expect(page).not_to have_selector('.smart-collection-filter')
  end

  it 'paginated, filterable ActiveRecord collection rendered as table without any actions' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.where("(postal_code)::int > ?", 10),
      paginate: 10,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name"
      },
      filters: {
        last_name: {
          placeholder: 'Filter by Last Name',
          match: :like,
        }
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path

    expect(page).to have_selector('.row > .col > .matestack-ui-bootstrap-input > input.form-control.smart-collection-filter#last_name')

    fill_in 'last_name', with: '12'

    find('#last_name').native.send_keys(:return)

    expect(page).to have_selector('tr.align-middle', count: 1)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 1 to 1 of 1 (8 hidden by filter)")
  end

  it 'paginated, filterable customized ActiveRecord collection rendered as table without any actions' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.all,
      paginate: 10,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: "Last Name"
      },
      filters: {
        last_name: {
          placeholder: 'Filter by Last Name',
          match: :like,
        }
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path

    expect(page).to have_selector('.row > .col > .matestack-ui-bootstrap-input > input.form-control.smart-collection-filter[id="last_name"]')

    fill_in 'last_name', with: '12'

    find('#last_name').native.send_keys(:return)

    expect(page).to have_selector('tr.align-middle', count: 1)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 1 to 1 of 1 (19 hidden by filter)")
  end

  it 'paginated, filterable ActiveRecord collection rendered as table actions provided by slot' do
    ExamplePage.define_method(:table_item_actions) do |customer|
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
    ExamplePage.define_method(:customer_delete_action_config) do |customer|
      {
        method: :delete,
        path: dummy_customer_path(id: customer.id),
        confirm: true,
        success: {
          emit: "success"
        }
      }
    end
    ExamplePage.define_method(:collection_config) do
      {
        id: 'customer-collection',
        items: Customer.all,
        paginate: 10,
        rerender_on: "success",
        hoverable: true,
        columns: {
          id: 'ID',
          first_name: "First Name",
          last_name: "Last Name"
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

    matestack_render do
      bs_smart_collection collection_config
    end

    visit example_path

    expect(page).to have_selector('table.table.table-hover[id="customer-collection"]')
    expect(page).to have_selector('th[scope="col"]', text: "ID")
    expect(page).to have_selector('th[scope="col"]', text: "First Name")
    expect(page).to have_selector('th[scope="col"]', text: "Last Name")
    expect(page).to have_selector('th[scope="col"]', text: "")

    expect(page).to have_selector('tr.align-middle > td.text-end > a > button.btn.btn-outline-primary.btn-sm.m-1 > svg', count: 10)
    expect(page).to have_selector('tr.align-middle > td.text-end > a > button.btn.btn-outline-danger.btn-sm.m-1 > svg', count: 10)
  end

  it 'paginated, filterable ActiveRecord collection rendered as table with customizable column heading and content rendering' do
    collection_config = {
      id: 'customer-collection',
      items: Customer.all,
      paginate: 10,
      rerender_on: "success",
      hoverable: true,
      columns: {
        id: 'ID',
        first_name: "First Name",
        last_name: {
          heading: 'Name',
          format: -> (column_data){ "#{column_data.first}." },
          text: :end
        }
      },
      filters: {
        last_name: {
          placeholder: 'Filter by Last Name',
          match: :like,
        }
      }
    }
    matestack_render do
      bs_smart_collection collection_config
    end
    visit example_path
    # sleep
    expect(page).to have_selector('table.table.table-hover[id="customer-collection"]')
    expect(page).to have_selector('th[scope="col"]', text: "ID")
    expect(page).to have_selector('th[scope="col"]', text: "First Name")
    expect(page).to have_selector('th.text-end[scope="col"]', text: "Name")

    expect(page).to have_selector('tr.align-middle', count: 10)

    expect(page).to have_selector('tr.align-middle > td.text-end', text: "l.", count: 10)
  end

  it 'paginated, filterable ActiveRecord collection rendered via custom method provided by slot' do
    ExamplePage.define_method(:collection_rendering) do |customers|
      bs_row do
        customers.each do |customer|
          bs_col xl: 4, class: "mb-3" do
            collection_card customer
          end
        end
      end
    end
    ExamplePage.define_method(:collection_card) do |customer|
      bs_card title: customer.last_name, class: "h-100" do
        paragraph class: "fw-lighter", text: customer.first_name
        action customer_delete_action_config(customer) do
          bs_btn outline: true, size: :sm, variant: :danger do
            bs_icon name: 'trash2', size: 20
          end
        end
      end
    end
    ExamplePage.define_method(:customer_delete_action_config) do |customer|
      {
        method: :delete,
        path: dummy_customer_path(id: customer.id),
        confirm: true,
        success: {
          emit: "success"
        }
      }
    end
    ExamplePage.define_method(:collection_config) do
      {
        id: 'customer-collection',
        items: Customer.all,
        paginate: 10,
        filters: {
          last_name: {
            placeholder: 'Filter by Last Name',
            match: :like,
          }
        },
        slots: {
          collection_rendering: method(:collection_rendering)
        }
      }
    end

    matestack_render do
      bs_smart_collection collection_config
    end

    visit example_path

    expect(page).not_to have_selector('table.table.table-hover[id="customer-collection"]')

    expect(page).to have_selector('.card.h-100', count: 10)

    expect(page).to have_selector('.row > .col > .matestack-ui-bootstrap-input > input.form-control.smart-collection-filter[id="last_name"]')

    fill_in 'last_name', with: '12'

    find('#last_name').native.send_keys(:return)

    expect(page).to have_selector('.card.h-100', count: 1)

    expect(page).to have_selector('.current-pagination-state > small', text: "showing 1 to 1 of 1 (19 hidden by filter)")

  end

  it 'ActiveRecord collection with custom rendering per column' do
    ExamplePage.define_method(:collection_config) do
      {
        id: 'customer-collection',
        items: Customer.all,
        paginate: 10,
        columns: {
          id: 'ID',
          last_name: {
            heading: 'Last Name via slot',
            slot: method(:last_name_slot_rendering)
          }
        }
      }
    end

    ExamplePage.define_method(:last_name_slot_rendering) do |last_name|
      bs_badge last_name
    end

    matestack_render do
      bs_smart_collection collection_config
    end

    visit example_path

    expect(page).to have_selector('tr > td > span.badge', text: "last_name 1")

    expect(page).to have_selector('tr > td > span.badge', count: 10)
  end

  it 'paginated, filterable ActiveRecord collection with access to row object instance in column format proc' do
    ExamplePage.define_method(:collection_config) do
      {
        id: 'customer-collection',
        items: Customer.all,
        paginate: 10,
        columns: {
          id: 'ID',
          self: {
            heading: 'Row Instance Access via Format',
            format: -> (customer){ "#{customer.last_name} Access" },
          }
        }
      }
    end

    matestack_render do
      bs_smart_collection collection_config
    end

    visit example_path

    expect(page).to have_selector('tr > td', text: "last_name 1 Access")
  end

  it 'ActiveRecord collection with custom rendering per column with access to row object instance' do
    ExamplePage.define_method(:collection_config) do
      {
        id: 'customer-collection',
        items: Customer.all,
        paginate: 10,
        columns: {
          id: 'ID',
          self: {
            heading: 'Row Instance Access via Slot',
            slot: method(:column_slot_rendering_for_whole_object)
          }
        }
      }
    end

    ExamplePage.define_method(:column_slot_rendering_for_whole_object) do |customer|
      bs_badge "#{customer.first_name} #{customer.last_name}"
    end

    matestack_render do
      bs_smart_collection collection_config
    end

    visit example_path

    expect(page).to have_selector('tr > td > span.badge', text: "first_name 1 last_name 1")

    expect(page).to have_selector('tr > td > span.badge', count: 10)
  end

  it 'ActiveRecord collection with access to same row object/attributes in multiple columns' do
    ExamplePage.define_method(:collection_config) do
      {
        id: 'customer-collection',
        items: Customer.all,
        paginate: 10,
        columns: {
          id: 'ID',
          self: {
            heading: 'Row Instance Access via Format',
            format: -> (customer){ "#{customer.last_name} Access" },
          },
          self_2: {
            attribute: :self,
            heading: 'Row Instance Access via Slot',
            slot: method(:column_slot_rendering_for_whole_object)
          },
          last_name: {
            heading: 'Last Name',
            text: :end
          },
          last_name_2: {
            attribute: :last_name,
            heading: 'Last Name 2',
            text: :end
          }
        }
      }
    end

    ExamplePage.define_method(:column_slot_rendering_for_whole_object) do |customer|
      bs_badge "#{customer.first_name} #{customer.last_name}"
    end

    matestack_render do
      bs_smart_collection collection_config
    end

    visit example_path

    expect(page).to have_content("Row Instance Access via Format")
    expect(page).to have_content("Row Instance Access via Slot")
    expect(page).to have_content("Last Name")
    expect(page).to have_content("Last Name 2")

    expect(page).to have_selector('tr > td', text: "last_name 1 Access")
    expect(page).to have_selector('tr > td > span.badge', text: "first_name 1 last_name 1")
    expect(page).to have_selector('tr > td.text-end', text: "last_name 1", count: 2)
  end

end
