class Bootstrap::Components::Progress < Matestack::Ui::Component
  def response 
    div id: "#{@options[:id]}", class: "progress p-0", attributes: { 'style':"height: #{progress_height}" } do
      # slot in case of multiple bars
      if options[:slots] && options[:slots][:custom_bar]
        slot options[:slots][:custom_bar]
      else
        div class: "progress-bar #{progress_classes}", 
            attributes: { 'role':"progressbar", 'style':"width: #{progress_width}",'aria-valuenow':"#{@options[:value]}", 'aria-valuemin':"#{progress_min}", 'aria-valuemax':"#{progress_max}" } do
              plain @options[:text];
            end
      end
      yield_components
    end
  end

  protected

  def progress_width
    if @options[:value].present?
      attrs = @options[:value].to_s
      attrs << '%'
      attrs
    end
  end

  def progress_height
    if @options[:height].present?
      attrs = @options[:height].to_s
      attrs << 'px'
      attrs
    end
  end

  def progress_min
    attrs = "0"
    if @options[:valuemin].present?
      attrs = @options[:valuemin].to_s
    end
    attrs
  end

  def progress_max
    attrs = "100"
    if @options[:valuemax].present?
      attrs = @options[:valuemax].to_s
    end
    attrs
  end

  def progress_classes
    classes = []

    classes << "bg-#{@options[:color]}" if @options[:color].present? 
    classes << "progress-bar-striped" if @options[:striped].present? && @options[:striped] == true
    classes << "progress-bar-animated" if @options[:animated].present? && @options[:animated] == true

    classes << @options[:class]
    classes.join(' ')
  end
end