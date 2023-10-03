defmodule PhoenixBits.Chat do

  def shout(changeset) do
    conversation_id = Ecto.Changeset.get_field(changeset, :conversation_id)
    PhoenixBits.Endpoint.broadcast("chat:conversation:#{}", "shout", %{message: changeset})
    Task.async(fn ->
      persist!(changeset)
    end)
  end

  def persist!(changeset) do
    IO.inspect({changeset, "peristed"})
  end

end
