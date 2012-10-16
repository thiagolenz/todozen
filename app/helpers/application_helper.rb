module ApplicationHelper
  def todo_desc(desc)
    unless desc.nil?
      desc.gsub(/(?:^|\s)#(\w+)/i) { |s| " <a href='/todos/#{s[s.index("#")+1,s.length]}'>#{s}</a>" }
    end
  end
end
