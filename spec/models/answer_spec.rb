describe Answer, type: :model do

  context "Only comment" do
    it "must have content" do
      user = FactoryBot.build :user
      user.skip_confirmation!
      user.save
      question = FactoryBot.create :question, user: user
      answer = FactoryBot.create :answer, question: question, user: user
      expect(answer.content).not_to eq nil
    end
  end

  describe "associations" do
    it {should belong_to :user}
    it {should belong_to :question}
    it {should have_many :likes}
    it {should have_many :likers}
  end
end
