defmodule PhoenixBits.Repo.Migrations.CreateChatConversationsUsers do
  use Ecto.Migration

  def change do
    create table(:chat_conversations_users) do
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :conversation_id, references(:chat_conversations, on_delete: :nothing, type: :binary_id)
      add :last_message_read_at, :naive_datetime

      timestamps()
    end
    create index(:chat_conversations_users, [:user_id, :conversation_id])
  end
end
