# require 'rails_helper'
#
# RSpec.describe "Bootstrap::Content::Table", type: :feature, js: true do
#   include Utils
#
#   it 'create blank table' do
#     matestack_render do
#       smart_table
#     end
#     visit example_path
#     expect(page).to have_selector('table')
#   end
#
#   it 'appears with content and header' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age]
#     end
#     visit example_path
#       expect(page).to have_content('Mark')
#       expect(page).to have_selector('thead')
#       expect(page).to have_content('Name')
#       expect(page).to have_content('Age')
#   end
#
#   it 'has filter' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                 including: [:created_at, :name, :email, :age],
#                 filter: [:name, :email], filter_option: :like
#     end
#     visit example_path
#       expect(page).to have_selector('input')
#       fill_in('name', :with => 'Mark')
#       click_button('Filter')
#       expect(page).to have_content('Mark')
#       expect(page).to_not have_content('Anh')
#       click_button('Reset')
#       expect(page).to have_content('Anh')
#   end
#
#   it 'has order option' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                 including: [:created_at, :name, :email, :age],
#                 filter: [:name, :email], filter_option: :like,
#                 order: [{created_at: :desc}]
#     end
#     visit example_path
#       expect(page).to have_content('sort by:')
#       #TODO: maybe there is a better way to test ordering functionality?
#   end
#
#   it 'has zebra-striping' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   striped: true
#     end
#     visit example_path
#       expect(page).to have_selector(".table-striped")
#   end
#
#   it 'is hoverable' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   hoverable: true
#     end
#     visit example_path
#       expect(page).to have_selector(".table-hover")
#   end
#
#   it 'can have different colors / variant ' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   variant: :primary
#     end
#     visit example_path
#       expect(page).to have_selector('.table-primary')
#   end
#
#   it 'is borderless' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   borderless: true
#     end
#     visit example_path
#       expect(page).to have_selector('.table-borderless')
#   end
#
#   it 'can have different border colors' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   border_variant: :primary
#     end
#     visit example_path
#       expect(page).to have_selector('.table-bordered.border-primary')
#   end
#
#   it 'is responsive' do
#     matestack_render do
#       smart_table base_query: Person.all,
#       including: [:created_at, :name, :email, :age],
#       responsive: true
#     end
#     visit example_path
#       expect(page).to have_selector(".table-responsive")
#   end
#   it 'is responsive from given breakpoint' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   responsive: :md
#     end
#     visit example_path
#       expect(page).to have_selector(".table-responsive-md")
#   end
#
#   it 'can have custom header class' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   thead_class: "foobar"
#     end
#     visit example_path
#       expect(page).to have_selector('thead.foobar')
#   end
#
#   it 'can have custom body class' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   tbody_class: "foobar"
#     end
#     visit example_path
#       expect(page).to have_selector('tbody.foobar')
#   end
#
#   it 'can have footer and custom footer class' do
#     matestack_render do
#       smart_table base_query: Person.all,
#                   including: [:created_at, :name, :email, :age],
#                   footer: ["Footer", "Namefoot"], tfoot_class: "foobar"
#     end
#     visit example_path
#       expect(page).to have_selector('tfoot.foobar')
#       expect(page).to have_content('Namefoot')
#   end
# end
