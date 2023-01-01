defmodule SpurCrossPlayers.Notifications.Email do
  import Bamboo.Email
  import Bamboo.Phoenix

  @default_sender "Spur Cross Players<no-reply@spurcrossplayers.com>"

  def test_email(to) do
    base_email()
    |> to(to)
    |> subject("This is a test email!")
    |> html_body("<strong>This is a test email!</strong>")
    |> text_body("This is a test email!")
  end

  defp base_email() do
    new_email()
    |> from(@default_sender)
    |> put_html_layout({SpurCrossPlayersWeb.LayoutView, "email.html"})
    |> put_text_layout({SpurCrossPlayersWeb.LayoutView, "email.text"})
  end
end
