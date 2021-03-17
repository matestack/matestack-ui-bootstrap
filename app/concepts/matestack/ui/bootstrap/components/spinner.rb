class Matestack::Ui::Bootstrap::Components::Spinner < Matestack::Ui::Component

  optional :class
  optional :kind, :variant, :size, :sr_only

  def response
    div spinner_attributes do
      span class: "visually-hidden" do
        plain context.sr_only
      end
    end
  end

  protected

  def spinner_attributes
    options.merge(
      class: spinner_class,
      'role': "status"
    )
  end

  def spinner_class
    [].tap do |classes|
      spinner_kind = context.kind || :border
      classes << "spinner-#{context.spinner_kind}"
      classes << "text-#{context.variant || 'primary'}"
      classes << "spinner-#{context.spinner_kind}-sm" if context.size
      #optional classes
      classes << context.class
    end.join(' ').strip
  end
end
