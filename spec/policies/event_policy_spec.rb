require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:event) { create(:event, user: user) }
  let(:event_w_pincode) { create(:event, user: user, pincode: '222') }

  subject { described_class }

  context 'when user owner' do
    permissions :destroy?, :edit?, :update? do
      it { is_expected.to permit(user, event) }
    end

    permissions :new?, :create? do
      it { is_expected.to permit(user, event) }
    end

    permissions :show? do
      it { is_expected.to permit(user, event_w_pincode) }
    end
  end

  context 'when user not an owner' do
    permissions :destroy?, :edit?, :update? do
      it { is_expected.not_to permit(other_user, event) }
    end

    permissions :new?, :create? do
      it { is_expected.to permit(other_user, event) }
    end

    permissions :show? do
      it { is_expected.not_to permit(other_user, event_w_pincode) }
    end
  end
end
