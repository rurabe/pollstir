module PollsHelper
  def full_edit_url(poll)
    request.protocol + request.host + ":" + request.port.to_s + "/edit/" + poll.edit_url
  end
  
  def full_public_url(poll)
    request.protocol + request.host + ":" + request.port.to_s + "/" + poll.id.to_s
  end
end
