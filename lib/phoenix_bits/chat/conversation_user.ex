defmodule PhoenixBits.Chat.ConversationUser do
  use Ecto.Schema
  alias PhoenixBits.{User, Conversation}

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "chat_conversation_users" do
    belongs_to :conversation, Conversation
    field :last_message_read_at, :naive_datetime
    belongs_to :user, User

    timestamps()
  end

end
