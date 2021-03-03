module Matestack::Ui::Bootstrap::Content::SmartCollection::Paginate

  def paginate_partial
    div class: "current-pagination-state ps-2" do
      small do
        plain "showing #{@collection.from}"
        plain "to #{@collection.to}"
        plain "of #{@collection.filtered_count}"
        if (@collection.base_count - @collection.filtered_count) > 0
          plain "(#{@collection.base_count - @collection.filtered_count} hidden by filter)"
        end
      end
    end
    pagination_nav_partial
  end

  def pagination_nav_partial
    nav class: "table-responsive", attributes: { style: "display: -webkit-box;" } do
      ul class: ul_classes do
        li class: "page-item previous #{ 'disabled' if current_page == 1 }" do
          collection_content_previous class: 'page-link' do
            bs_icon name: "chevron-left", size: 10
          end
        end
        if @collection.pages.count >= 9 && current_page > 5
          li class: "page-item" do
            collection_content_page_link class: 'page-link', page: 1 do
              plain 1
            end
          end
          unless current_page == 6
            li class: "page-item disabled" do
              link class: 'page-link', path: "#" do
                plain "..."
              end
            end
          end
        end
        @collection.pages.each do |page|
          if (current_page-page).abs < 5
            li class: "page-item #{ 'active' if current_page == page }" do
              collection_content_page_link class: 'page-link', page: page do
                plain page
              end
            end
          end
        end
        if @collection.pages.count >= 9 && last_page-current_page > 4
          unless current_page == last_page-5
            li class: "page-item disabled" do
              link class: 'page-link', path: "#" do
                plain "..."
              end
            end
          end
          li class: "page-item" do
            collection_content_page_link class: 'page-link', page: last_page do
              plain last_page
            end
          end
        end
        li class: "page-item next #{ 'disabled' if current_page == last_page }" do
          collection_content_next class: 'page-link' do
            bs_icon name: "chevron-right", size: 10
          end
        end
      end
    end
  end

  def ul_classes
    [].tap do |classes|
      classes << "pagination"
      classes << "justify-content-end"
      classes << "mt-3"
    end.join(' ').strip
  end

  def current_page
    current_offset = params["#{bs_id}-offset"].try(:to_i)
    (current_offset/paginate)+1 if current_offset && paginate.present?
  end

  def last_page
    if @collection.filtered_count%paginate == 0
      (@collection.filtered_count/paginate)
    else
      (@collection.filtered_count/paginate)+1
    end
  end

end
