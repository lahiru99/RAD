module HomeHelper
  def selectable_answers(answers)
    answers.values.reject!(&:blank?)
  end

  def correct_answers(answers)
    correct = []
    answers.values.each_with_index do |answer, index|
      if answer == "true"
        correct << index
      end
    end
    correct
  end

  def submit_answer
    binding.pry
    redirect_to "/#{@page+=1}"
  end
end
