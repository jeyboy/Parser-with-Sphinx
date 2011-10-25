module NewsHelper
  def ruby_line(news_id, user_id,on_limit=1)
    ret = ""
    5.times do |index|
      ret+="<div id='star_#{index.to_s}' class='#{index < on_limit ? "check_ruby" : "uncheck_ruby"}' onclick=\"sendRating(this,'#{news_id}', '#{user_id}')\">&nbsp</div>"
    end
    ret+"<div class='clear'></div>"
  end
end
