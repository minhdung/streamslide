class Question
#  include ActiveModel::Validations
#  include ActiveModel::Conversion
#  extend ActiveModel::Naming
#  
#  attr_accessor :id, :host, :usr, :slug, :content, :voteup_num, :votedown_num, :rhelper
#  validates_presence_of :host, :usr, :slug, :content 
#
#  def initialize(attributes = {})
#    @rhelper = Redishelper.new($redis)
#
#    attributes.each do |name, value|
#      send("#{name}=", value)
#    end
#  end
#  
#  def add!
#    @rhelper.add_new_question(@host, @usr, @slug, @content)
#  end
#
#  def vote_up
#    @rhelper.question_voteup(@host, @slug, @id)    
#  end
#
#  def vote_down
#
#  end 
#
#  def self.get_all
#    return @rhelper.get_questions
#  end
end
