defmodule PhoenixBits.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoneixBits.Chat.Conversation

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "chat_messages" do
    field :body, :string
    field :file_url, :string
    field :file_name, :string
    belongs_to :conversation, Conversation

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
