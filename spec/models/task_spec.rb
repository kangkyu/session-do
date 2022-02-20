require 'rails_helper'

describe Task do

  describe '.time_passed_by' do
    it "returns negative time in the future" do
      task = Task.new(task_attributes)
      allow(Time).to receive(:now).and_return(task.done_at + 2.hours)
      # Time.stub(:now).and_return(task.done_at + 2.hours)
      expect(task.time_passed_by).to be > 0
      expect(task.time_passed_by).to be_a(Integer)
    end
    it "returns negative time in the past" do
      task = Task.new(task_attributes)
      allow(Time).to receive(:now).and_return(task.done_at - 2.hours)
      expect(task.time_passed_by).to be < 0
    end
  end

  describe '.bar_length' do
    it "returns an integer" do
      task = Task.new(task_attributes)
      allow(Time).to receive(:now).and_return(task.done_at + 2.hours)
      expect(task.bar_length).to be_a(Integer)
    end
  end

  describe '.restart_done_at' do
    it "sets done_at value with daily" do
      task = Task.new(task_attributes)
      task.restart_done_at
      expect(task).not_to be_persisted
      expect(task.done_at.to_date).to eq Date.today + 1
    end

    it "sets done_at value with later" do
      task = Task.new(task_attributes(later: 3))
      task.restart_done_at
      expect(task).not_to be_persisted
      expect(task.done_at.to_date).to eq Date.today + 3
    end

    it "sets done_at value without later" do
      task = Task.new(task_attributes(later: nil, is_daily: false))
      task.restart_done_at
      expect(task).not_to be_persisted
      expect(task.done_at.to_date).to eq Date.today
    end
  end

  # describe '.start_done_at' do
  #   it "sets done_at value with later" do
  #     timestamp = Time.new(2010, 10, 10)
  #     task = Task.new(done_at: timestamp, later: 3)
  #     task.start_done_at
  #     expect(task).not_to be_persisted
  #     expect(task.done_at.to_date).to eq timestamp.to_date + 3
  #   end

  #   it "sets done_at value without later" do
  #     timestamp = Time.new(2010, 10, 10)
  #     task = Task.new(done_at: timestamp, later: nil)
  #     task.start_done_at
  #     expect(task).not_to be_persisted
  #     expect(task.done_at.to_date).to eq timestamp.to_date
  #   end
  # end

  context "Validation" do
    it "is valid with all the attributes in place" do
      task = Task.new(task_attributes)
      expect(task).to be_valid
    end

    it "is invalid without a name" do
      task = Task.new(task_attributes(name: nil))
      task.valid?
      expect(task.errors[:name]).to include("can't be blank")
    end

    it "is not invalid with a duplicate name attribute" do
      Task.create(name: "family dinner",
        comment: "",
        done_at: "2015-02-04 08:00:00",
        user_id: 3,
        is_daily: true)
      task = Task.new(name: "family dinner",
        comment: "another task with a name the same",
        done_at: "2015-02-04 08:00:00",
        user_id: 3,
        is_daily: true)
      task.valid?
      expect(task.errors[:name]).not_to include("has already been taken")
    end

    it "is not invalid without a comment" do
      task = Task.new(task_attributes(comment: nil))
      task.valid?
      expect(task.errors[:comment]).not_to include("can't be blank")
    end

    it "is invalid with comment too long" do
      super_long_comment = "https://fullscreen.udemy.com/learn-android-application-development-y https://classroom.udacity.com/courses/ud845 https://developers.google.com/youtube/android/player/sample-applications https://fullscreen.udemy.com/data-structures-and-algorithms-deep-dive-using-java"
      task = Task.new(task_attributes(comment: super_long_comment))
      expect(task.valid?).to eq(false)
      expect(task.errors[:comment]).to include("is too long (maximum is 255 characters)")
    end

    it "is invalid if later is string" do
      task = Task.new(task_attributes(later: "abc"))
      expect(task).not_to be_valid
    end

    it "is invalid if later is negative integer" do
      task = Task.new(task_attributes(later: -1))
      expect(task).not_to be_valid
    end
  end

end
