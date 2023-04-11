class MatestackUiVueJsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "matestack_ui_vue_js"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
