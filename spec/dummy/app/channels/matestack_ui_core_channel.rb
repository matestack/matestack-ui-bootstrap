class MatestackUiCoreChannel < ApplicationCable::Channel
  def subscribed
    stream_from "matestack_ui_core"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
