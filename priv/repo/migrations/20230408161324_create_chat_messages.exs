defmodule PhoenixBits.Repo.Migrations.CreateChatMessages do
  use Ecto.Migration

  def change do
    create table(:chat_messages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :text
      add :file_url, :string
      add :file_name, :string
      add :author, references(:chat_conversations, type: :binary_id, on_delete: :nothing)

      timestamps()
    end
  end
end
