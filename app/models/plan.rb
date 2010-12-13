class Plan < ActiveRecord::Base

  validates_presence_of :title, :subtitle, :target_title, :target_body, :financial, :action, :status

end
