class UserStatistic < ApplicationRecord
  belongs_to :user

  #Virtual Attributes
  def total_questions  
    self.right_questions + self.wrong_questions
  end

  # Método de Classe
  def self.set_statistic(answer, current_user)
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1
      user_statistic.save
      #if @answer.correct?
      #  user_statistic.right_questions += 1
      #else
      #  user_statistic.wrong_questions_questions += 1
      #end
      #user_statistic.save
    end
  end
end
