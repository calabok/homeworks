# rubocop:disable all
# describe Notification
describe Notification do
  describe "#to_s" do
    let(:mentor) { double("Mentor", name: :name) }
    let(:student) { double("Mentor", name: :name) }

    subject { Notification.new(mentor, student, :content) }
    let(:string) do
      "To: #{mentor.name},from: #{student.name}," "Contents: content, status: false"
    end
    it { expect(subject.to_s).to eq string }
  end
end
