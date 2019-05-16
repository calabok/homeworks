# rubocop:disable all
describe Mentor do
  subject { Mentor.new(:name) }
  let!(:student) { Student.new(:name) }
  describe "check_homeworks!" do
    context "changes status Home Work" do
      let!(:homework) { Homework.new(:title, :homework, student) }
      let!(:notification) { Notification.new(:whom, :from_whom, homework) }
      before do
        subject.notifications << notification
      end
      it { expect { subject.check_homeworks! }.to change { homework.status }.from(false).to(true) }
    end
  end
  describe "subscribe_to_student" do
    it { expect { subject.subscribe_to_student(student) }.to change { subject.subscriptions.count }.by(1) }
    it { expect { subject.subscribe_to_student(student) }.to change { student.subscribers.count }.by(1) }
  end

  describe "read_notifications!" do
    context "statuts notification" do
      let!(:notification) { Notification.new(:whom, :from_whom, :homework) }
      before do
        subject.notifications << notification
      end
      it { expect { subject.read_notifications! }.to change { notification.status }.from(false).to(true) }
    end
  end
end
# rubocop:enable all
