module ApplicationHelper
  def todo_desc(desc)
    unless desc.nil?
      desc.gsub(/(?:^|\s)#(\w+)/i) { |s| " <a href='/todos/#{s[s.index("#")+1,s.length]}'>#{s}</a>" }
    end
  end

  def class_for_tag(selected_tag, tag)
    puts tag
    if (selected_tag.nil? and tag.nil?) or selected_tag.eql? tag
        'blue'
      else
        'blue-stripe'
      end
  end
end
