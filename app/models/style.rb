class Style < ApplicationRecord

  def to_s
    "#{name} - #{bjcp_category}"
  end
end
