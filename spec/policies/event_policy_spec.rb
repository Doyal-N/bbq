require 'rails_helper'

describe EventPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:event_not_pincode) { create(:event, user: user) }
  let(:event_with_pincode) { create(:event, user: user, pincode: '111') }

  let(:correct_cookies) { { "event_#{event_with_pincode.id}_pincode" => '111' } }

  describe 'when event creator' do
    let(:creator) { UserContext.new(user, {}) }

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(creator, event_not_pincode) }
    end

    permissions :show? do
      it { is_expected.to permit(creator, event_with_pincode) }
    end
  end

  describe 'when other user' do
    let(:other_user) { create(:user) }
    let(:other_user_not_pincode) { UserContext.new(other_user, {}) }
    let(:other_user_w_pincode) { UserContext.new(other_user, correct_cookies) }

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(other_user_not_pincode, event_not_pincode) }
    end

    permissions :show? do
      it { is_expected.not_to permit(other_user_not_pincode, event_with_pincode) }
    end

    permissions :show? do
      it { is_expected.to permit(other_user_w_pincode, event_with_pincode) }
    end
  end

  describe 'when unauthorized user' do
    let(:anonim) { UserContext.new(nil, correct_cookies) }

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(anonim, event_not_pincode) }
    end

    permissions :show? do
      it { is_expected.to permit(anonim, event_with_pincode) }
    end
  end
end
