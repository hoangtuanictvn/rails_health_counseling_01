describe Booking, type: :model do
  context "Only create" do
    before do
      user = FactoryBot.build :user
      user.skip_confirmation!
      user.save
      doctor = FactoryBot.build :doctor
      doctor.skip_confirmation!
      doctor.save
      @booking = FactoryBot.build :booking, user: user, doctor: doctor
    end

    it "must have title" do
      expect(@booking.title).not_to eq nil
    end

    it "must by an user" do
      expect(@booking.user).not_to eq nil
    end

    it "must have a doctor" do
      expect(@booking.doctor).not_to eq nil
    end

    it "must have reason" do
      expect(@booking.reason).not_to eq nil
    end

    it "must have start time" do
      expect(@booking.start_time).not_to eq nil
    end

    it "must have stop time" do
      expect(@booking.stop_time).not_to eq nil
    end
  end

  describe "associations" do
    it {should belong_to :user}
    it {should belong_to :doctor}
    it {should belong_to :category}
  end
end
