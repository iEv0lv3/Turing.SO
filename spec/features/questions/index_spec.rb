require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the home page' do
    before :each do
      user = create(:user)
      user.confirm

      @question_1 = Question.create!({subject: "Ruby methods",
                                      content: "What is attr_reader?",
                                      upvotes: 1,
                                      forum: 0,
                                      user_id: user.id})

      @question_2 = Question.create!({subject: "Jobs",
                                      content: "Why can't I get a job?",
                                      upvotes: 1,
                                      forum: 1,
                                      user_id: user.id})

      @question_3 = Question.create!({subject: "Ruby methods",
                                      content: "What is attr_accessor?",
                                      upvotes: 1,
                                      forum: 0,
                                      user_id: user.id})

      @question_4 = Question.create!({subject: "Interviews",
                                      content: "Best interview practices",
                                      upvotes: 1,
                                      forum: 1,
                                      user_id: user.id})
    end

    it 'I click on a button I can navigate to the technical forums page' do

      visit '/'

      expect(page).to have_link('Technical')
      click_on 'Technical'

      expect(current_path).to eq('/technical_forum')

      expect(page).to have_content(@question_1.subject)
      expect(page).to have_content(@question_1.content)
      expect(page).to have_content(@question_1.upvotes)
    end

    it 'I click on a button I can navigate to the technical forums page and dont see professional quesitons' do

      visit '/'

      expect(page).to have_link('Technical')
      click_on 'Technical'

      expect(current_path).to eq('/technical_forum')

      expect(page).not_to have_content(@question_2.subject)
      expect(page).not_to have_content(@question_2.content)
    end

    it 'I click on a button I can navigate to the professional forums page' do

      visit '/'

      expect(page).to have_link('Professional')
      click_on 'Professional'

      expect(current_path).to eq('/professional_forum')

      expect(page).to have_content(@question_2.subject)
      expect(page).to have_content(@question_2.content)
      expect(page).to have_content(@question_2.upvotes)
    end

    it 'I click on a button I can navigate to the professional forums page and dont see technical quesitons' do

      visit '/'

      expect(page).to have_link('Professional')
      click_on 'Professional'

      expect(current_path).to eq('/professional_forum')

      expect(page).not_to have_content(@question_1.subject)
      expect(page).not_to have_content(@question_1.content)
    end
  end
end
