class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def unsubscribed
  end

  def send_comment(data)
    puts "++++++++++++"
    puts "+++TRYING+++"
    puts "++++++++++++"
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
    puts "-------------"
    puts "---SUCCESS---"
    puts "-------------"
  end
end