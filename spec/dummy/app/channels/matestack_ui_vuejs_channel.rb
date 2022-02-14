class MatestackUiVueJsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "matestack_ui_vuejs"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
