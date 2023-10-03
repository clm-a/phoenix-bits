defmodule PhoenixBits.User do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :display_name, :string
    timestamps()
  end
end
