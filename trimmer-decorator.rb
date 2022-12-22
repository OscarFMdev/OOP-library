require './decorator'
# Capitalize decorator class
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.trim
  end
end
