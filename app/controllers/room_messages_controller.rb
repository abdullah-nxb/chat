class RoomMessagesController < ApplicationController
  include EmojiHelper
  before_action :load_entities

  def create
    params[:room_message][:message] = emojify(params[:room_message][:message])
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)

    RoomChannel.broadcast_to @room, @room_message
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
