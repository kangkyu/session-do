require 'rails_helper'

describe Task do

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
  end

end