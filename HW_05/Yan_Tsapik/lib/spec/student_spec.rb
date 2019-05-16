# rubocop:disable all
describe Student do
  let(:name) { :name }
  subject { Student.new(name) }
  describe "#add_subscriber" do
    context "add Array" do
      let(:subscriber) { Object.new }
      it { expect { subject.add_subscriber(subscriber) }.to change { subject.subscribers.count }.by(1) }
    end
  end

  describe "create_homework" do
    subject { Student.new(name) }
    context "add to Array" do
      let(:content) { :content }
      it { expect { subject.create_homework(name, content) }.to change { subject.hws.count }.by(1) }
    end
  end
  describe "#submit_homework" do
    let(:double_hw) { double("homework") }
    it { expect(subject.submit_homework(double_hw)).to be_kind_of(Net::HTTPSuccess) }
  end
end

# rubocop:enable all
