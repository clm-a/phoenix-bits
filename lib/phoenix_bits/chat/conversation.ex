defmodule PhoenixBits.Chat.Conversation do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixBits.Chat.{Message, ConversationUser}

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "chat_conversations" do
    has_many :messages, Message

    has_many :conversations_users, ConversationUser

    timestamps()
  end
end
