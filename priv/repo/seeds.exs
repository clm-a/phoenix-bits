# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixBits.Repo.insert!(%PhoenixBits.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
require Logger

{2, [user1, user2]} = PhoenixBits.Repo.insert_all(PhoenixBits.User, 
[%{display_name: "Clément", inserted_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)},
%{display_name: "Michel", inserted_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)}], returning: [:id])

conversation = %PhoenixBits.Chat.Conversation{inserted_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)}
|> PhoenixBits.Repo.insert!()
Logger.info("Conversation created: #{inspect conversation}")


PhoenixBits.Repo.insert_all(PhoenixBits.Chat.ConversationUser, [%{
  user_id: user1.id,
  inserted_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second),
  updated_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)
},
%{
  user_id: user2.id,
  inserted_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second),
  updated_at: NaiveDateTime.local_now() |> NaiveDateTime.truncate(:second)
}])
