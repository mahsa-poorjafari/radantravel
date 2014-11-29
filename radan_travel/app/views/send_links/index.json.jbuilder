json.array!(@send_links) do |send_link|
  json.extract! send_link, :id, :sender_email, :receiver_email, :current_link, :text, :subject
  json.url send_link_url(send_link, format: :json)
end
