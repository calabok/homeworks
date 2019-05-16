# rubocop:disable all
describe Homework do
  let!(:student) { Student.new(:name) }
  subject { Homework.new(:title, :content, student) }
  describe "notify" do
    let!(:mentor) { Mentor.new(:name) }

    before do
      student.subscribers << mentor
    end
    it { expect { subject.notify }.to change { mentor.notifications.count }.by(2) }
  end

  describe "#to_s" do
    let(:string) { "title, Contents: content, status: false" }
    it { expect(subject.to_s).to eq string }
  end
end
# rubocop:enable all
