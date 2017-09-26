class Prompt
  attr_accessor :uid, :title, :display_title, :order, :text, :related_information, :rule, :responses, :section

  def prompt_info
    {
        'uid' => uid,
        'title' => title,
        'order' => order,
        'rule' => rule,
        'text' => text,
        'display_title' =>display_title,
        'related_information' => related_information
    }
  end
end
