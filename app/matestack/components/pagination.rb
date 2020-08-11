class Components::Pagination < Matestack::Ui::StaticComponent

  def prepare
    @page_items = @options[:items] 
  end

  def response 
    nav attributes: { 'aria-label':"#{@options[:label]}" } do
      ul id: "#{@options[:id]}", class: "pagination #{ul_classes}" do
        if @options[:items].present? && @options[:items].length() >= 1
          @page_items.each_with_index do |(text, path), index|
            li class: "page-item #{"active" if @options[:active_item] == index}" do
              link class: "page-link", path: path do
                plain text
              end
            end
          end
        else
          # insert custom list
          yield_components
        end
      end
    end
  end

  protected

  def ul_classes
    classes = []
    classes << "pagination-#{pagination_sizes.at(@options[:size] - 1)}" if @options[:size].present? && @options[:size].between?(1, 2) 
    classes << @options[:class]
    classes.join(' ')
  end

  def pagination_sizes
    [:sm, :lg]
  end

end