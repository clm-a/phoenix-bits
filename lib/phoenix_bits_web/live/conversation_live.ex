defmodule PhoenixBitsWeb.ConversationLive do
  use Phoenix.LiveView


  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do

    with %{"id" => conversation_id} <- params,
      to_string(conversation_id),
      {:ok, conversation} <- PhoenixBits.Chat.Conversation.get_conversation(conversation_id),
      {:ok, messages} <- PhoenixBits.Chat.list_messages(conversation_id) do
      {:noreply, assign(socket, conversation: conversation, messages: messages)}
    end
  end

  def render(assigns) do
    ~H"""
      Hello world
    """
  
  end
end
