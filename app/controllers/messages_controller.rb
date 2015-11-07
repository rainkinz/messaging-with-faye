class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(message_params)
    render type: :js, locals: { messages_html: render_to_string(@message) }
    # render type: :js, content_type: 'application/javascript', locals: { messages_html: render_to_string(@message) }
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
