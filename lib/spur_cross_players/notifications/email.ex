defmodule SpurCrossPlayers.Notifications.Email do
  import Bamboo.Email

  @default_sender "Spur Cross Players<no-reply@spurcrossplayers.com>"

  def test_email(to) do
    new_email()
    |> from(@default_sender)
    |> to(to)
    |> subject("This is a test email!")
    |> text_body("This is a test email to #{to}")
    |> html_body("<strong>This is a test email to #{to}</strong>")
  end
end
