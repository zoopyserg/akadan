require 'rails_helper'

RSpec.feature "Index Friends Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:friend_1) { build :user, first_name: 'Friend', last_name: '1', created_at: 1.seconds.ago }
  let!(:friend_2) { build :user, first_name: 'Friend', last_name: '2', created_at: 2.seconds.ago }
  let!(:friend_3) { build :user, first_name: 'Friend', last_name: '3', created_at: 3.seconds.ago }
  let!(:friend_4) { build :user, first_name: 'Friend', last_name: '4', created_at: 4.seconds.ago }
  let!(:friend_5) { build :user, first_name: 'Friend', last_name: '5', created_at: 5.seconds.ago }
  let!(:friend_6) { build :user, first_name: 'Friend', last_name: '6', created_at: 6.seconds.ago }
  let!(:friend_7) { build :user, first_name: 'Friend', last_name: '7', created_at: 7.seconds.ago }
  let!(:friend_8) { build :user, first_name: 'Friend', last_name: '8', created_at: 8.seconds.ago }
  let!(:friend_9) { build :user, first_name: 'Friend', last_name: '9', created_at: 9.seconds.ago }
  let!(:friend_10) { build :user, first_name: 'Friend', last_name: '10', created_at: 10.seconds.ago }
  let!(:friend_11) { build :user, first_name: 'Friend', last_name: '11', created_at: 11.seconds.ago }
  let!(:friend_12) { build :user, first_name: 'Friend', last_name: '12', created_at: 12.seconds.ago }
  let!(:friend_13) { build :user, first_name: 'Friend', last_name: '13', created_at: 13.seconds.ago }
  let!(:friend_14) { build :user, first_name: 'Friend', last_name: '14', created_at: 14.seconds.ago }
  let!(:friend_15) { build :user, first_name: 'Friend', last_name: '15', created_at: 15.seconds.ago }
  let!(:friend_16) { build :user, first_name: 'Friend', last_name: '16', created_at: 16.seconds.ago }
  let!(:friend_17) { build :user, first_name: 'Friend', last_name: '17', created_at: 17.seconds.ago }
  let!(:friend_18) { build :user, first_name: 'Friend', last_name: '18', created_at: 18.seconds.ago }
  let!(:friend_19) { build :user, first_name: 'Friend', last_name: '19', created_at: 19.seconds.ago }
  let!(:friend_20) { build :user, first_name: 'Friend', last_name: '20', created_at: 20.seconds.ago }
  let!(:friend_21) { build :user, first_name: 'Friend', last_name: '21', created_at: 21.seconds.ago }
  let!(:friend_22) { build :user, first_name: 'Friend', last_name: '22', created_at: 22.seconds.ago }
  let!(:friend_23) { build :user, first_name: 'Friend', last_name: '23', created_at: 23.seconds.ago }
  let!(:friend_24) { build :user, first_name: 'Friend', last_name: '24', created_at: 24.seconds.ago }
  let!(:friend_25) { build :user, first_name: 'Friend', last_name: '25', created_at: 25.seconds.ago }
  let!(:friend_26) { build :user, first_name: 'Friend', last_name: '26', created_at: 26.seconds.ago }
  let!(:friend_27) { build :user, first_name: 'Friend', last_name: '27', created_at: 27.seconds.ago }
  let!(:friend_28) { build :user, first_name: 'Friend', last_name: '28', created_at: 28.seconds.ago }
  let!(:friend_29) { build :user, first_name: 'Friend', last_name: '29', created_at: 29.seconds.ago }
  let!(:friend_30) { build :user, first_name: 'Friend', last_name: '30', created_at: 30.seconds.ago }
  let!(:friend_31) { build :user, first_name: 'Friend', last_name: '31', created_at: 31.seconds.ago }
  let!(:friend_32) { build :user, first_name: 'Friend', last_name: '32', created_at: 32.seconds.ago }
  let!(:friend_33) { build :user, first_name: 'Friend', last_name: '33', created_at: 33.seconds.ago }
  let!(:friend_34) { build :user, first_name: 'Friend', last_name: '34', created_at: 34.seconds.ago }
  let!(:friend_35) { build :user, first_name: 'Friend', last_name: '35', created_at: 35.seconds.ago }
  let!(:friend_36) { build :user, first_name: 'Friend', last_name: '36', created_at: 36.seconds.ago }
  let!(:friend_37) { build :user, first_name: 'Friend', last_name: '37', created_at: 37.seconds.ago }
  let!(:friend_38) { build :user, first_name: 'Friend', last_name: '38', created_at: 38.seconds.ago }
  let!(:friend_39) { build :user, first_name: 'Friend', last_name: '39', created_at: 39.seconds.ago }
  let!(:friend_40) { build :user, first_name: 'Friend', last_name: '40', created_at: 40.seconds.ago }
  let!(:friend_41) { build :user, first_name: 'Friend', last_name: '41', created_at: 41.seconds.ago }
  let!(:friend_42) { build :user, first_name: 'Friend', last_name: '42', created_at: 42.seconds.ago }
  let!(:friend_43) { build :user, first_name: 'Friend', last_name: '43', created_at: 43.seconds.ago }
  let!(:friend_44) { build :user, first_name: 'Friend', last_name: '44', created_at: 44.seconds.ago }
  let!(:friend_45) { build :user, first_name: 'Friend', last_name: '45', created_at: 45.seconds.ago }
  let!(:friend_46) { build :user, first_name: 'Friend', last_name: '46', created_at: 46.seconds.ago }
  let!(:friend_47) { build :user, first_name: 'Friend', last_name: '47', created_at: 47.seconds.ago }
  let!(:friend_48) { build :user, first_name: 'Friend', last_name: '48', created_at: 48.seconds.ago }
  let!(:friend_49) { build :user, first_name: 'Friend', last_name: '49', created_at: 49.seconds.ago }
  let!(:friend_50) { build :user, first_name: 'Friend', last_name: '50', created_at: 50.seconds.ago }
  let!(:friend_51) { build :user, first_name: 'Friend', last_name: '51', created_at: 51.seconds.ago }
  let!(:friend_52) { build :user, first_name: 'Friend', last_name: '52', created_at: 52.seconds.ago }
  let!(:friend_53) { build :user, first_name: 'Friend', last_name: '53', created_at: 53.seconds.ago }
  let!(:friend_54) { build :user, first_name: 'Friend', last_name: '54', created_at: 54.seconds.ago }
  let!(:friend_55) { build :user, first_name: 'Friend', last_name: '55', created_at: 55.seconds.ago }
  let!(:friend_56) { build :user, first_name: 'Friend', last_name: '56', created_at: 56.seconds.ago }
  let!(:friend_57) { build :user, first_name: 'Friend', last_name: '57', created_at: 57.seconds.ago }
  let!(:friend_58) { build :user, first_name: 'Friend', last_name: '58', created_at: 58.seconds.ago }
  let!(:friend_59) { build :user, first_name: 'Friend', last_name: '59', created_at: 59.seconds.ago }
  let!(:friend_60) { build :user, first_name: 'Friend', last_name: '60', created_at: 60.seconds.ago }
  let!(:friend_61) { build :user, first_name: 'Friend', last_name: '61', created_at: 61.seconds.ago }
  let!(:friend_62) { build :user, first_name: 'Friend', last_name: '62', created_at: 62.seconds.ago }
  let!(:friend_63) { build :user, first_name: 'Friend', last_name: '63', created_at: 63.seconds.ago }
  let!(:friend_64) { build :user, first_name: 'Friend', last_name: '64', created_at: 64.seconds.ago }
  let!(:friend_65) { build :user, first_name: 'Friend', last_name: '65', created_at: 65.seconds.ago }
  let!(:friend_66) { build :user, first_name: 'Friend', last_name: '66', created_at: 66.seconds.ago }
  let!(:friend_67) { build :user, first_name: 'Friend', last_name: '67', created_at: 67.seconds.ago }
  let!(:friend_68) { build :user, first_name: 'Friend', last_name: '68', created_at: 68.seconds.ago }
  let!(:friend_69) { build :user, first_name: 'Friend', last_name: '69', created_at: 69.seconds.ago }
  let!(:friend_70) { build :user, first_name: 'Friend', last_name: '70', created_at: 70.seconds.ago }
  let!(:friend_71) { build :user, first_name: 'Friend', last_name: '71', created_at: 71.seconds.ago }
  let!(:friend_72) { build :user, first_name: 'Friend', last_name: '72', created_at: 72.seconds.ago }
  let!(:friend_73) { build :user, first_name: 'Friend', last_name: '73', created_at: 73.seconds.ago }
  let!(:friend_74) { build :user, first_name: 'Friend', last_name: '74', created_at: 74.seconds.ago }
  let!(:friend_75) { build :user, first_name: 'Friend', last_name: '75', created_at: 75.seconds.ago }
  let!(:friend_76) { build :user, first_name: 'Friend', last_name: '76', created_at: 76.seconds.ago }
  let!(:friend_77) { build :user, first_name: 'Friend', last_name: '77', created_at: 77.seconds.ago }
  let!(:friend_78) { build :user, first_name: 'Friend', last_name: '78', created_at: 78.seconds.ago }
  let!(:friend_79) { build :user, first_name: 'Friend', last_name: '79', created_at: 79.seconds.ago }
  let!(:friend_80) { build :user, first_name: 'Friend', last_name: '80', created_at: 80.seconds.ago }
  let!(:friend_81) { build :user, first_name: 'Friend', last_name: '81', created_at: 81.seconds.ago }
  let!(:friend_82) { build :user, first_name: 'Friend', last_name: '82', created_at: 82.seconds.ago }
  let!(:friend_83) { build :user, first_name: 'Friend', last_name: '83', created_at: 83.seconds.ago }
  let!(:friend_84) { build :user, first_name: 'Friend', last_name: '84', created_at: 84.seconds.ago }
  let!(:friend_85) { build :user, first_name: 'Friend', last_name: '85', created_at: 85.seconds.ago }
  let!(:friend_86) { build :user, first_name: 'Friend', last_name: '86', created_at: 86.seconds.ago }
  let!(:friend_87) { build :user, first_name: 'Friend', last_name: '87', created_at: 87.seconds.ago }
  let!(:friend_88) { build :user, first_name: 'Friend', last_name: '88', created_at: 88.seconds.ago }
  let!(:friend_89) { build :user, first_name: 'Friend', last_name: '89', created_at: 89.seconds.ago }
  let!(:friend_90) { build :user, first_name: 'Friend', last_name: '90', created_at: 90.seconds.ago }
  let!(:friend_91) { build :user, first_name: 'Friend', last_name: '91', created_at: 91.seconds.ago }
  let!(:friend_92) { build :user, first_name: 'Friend', last_name: '92', created_at: 92.seconds.ago }
  let!(:friend_93) { build :user, first_name: 'Friend', last_name: '93', created_at: 93.seconds.ago }
  let!(:friend_94) { build :user, first_name: 'Friend', last_name: '94', created_at: 94.seconds.ago }
  let!(:friend_95) { build :user, first_name: 'Friend', last_name: '95', created_at: 95.seconds.ago }
  let!(:friend_96) { build :user, first_name: 'Friend', last_name: '96', created_at: 96.seconds.ago }
  let!(:friend_97) { build :user, first_name: 'Friend', last_name: '97', created_at: 97.seconds.ago }
  let!(:friend_98) { build :user, first_name: 'Friend', last_name: '98', created_at: 98.seconds.ago }
  let!(:friend_99) { build :user, first_name: 'Friend', last_name: '99', created_at: 99.seconds.ago }
  let!(:friend_100) { build :user, first_name: 'Friend', last_name: '100', created_at: 100.seconds.ago }
  let!(:friend_101) { build :user, first_name: 'Friend', last_name: '101', created_at: 101.seconds.ago }
  let!(:friend_102) { build :user, first_name: 'Friend', last_name: '102', created_at: 102.seconds.ago }
  let!(:friend_103) { build :user, first_name: 'Friend', last_name: '103', created_at: 103.seconds.ago }
  let!(:friend_104) { build :user, first_name: 'Friend', last_name: '104', created_at: 104.seconds.ago }
  let!(:friend_105) { build :user, first_name: 'Friend', last_name: '105', created_at: 105.seconds.ago }
  let!(:friend_106) { build :user, first_name: 'Friend', last_name: '106', created_at: 106.seconds.ago }
  let!(:friend_107) { build :user, first_name: 'Friend', last_name: '107', created_at: 107.seconds.ago }
  let!(:friend_108) { build :user, first_name: 'Friend', last_name: '108', created_at: 108.seconds.ago }
  let!(:friend_109) { build :user, first_name: 'Friend', last_name: '109', created_at: 109.seconds.ago }
  let!(:friend_110) { build :user, first_name: 'Friend', last_name: '110', created_at: 110.seconds.ago }
  let!(:friend_111) { build :user, first_name: 'Friend', last_name: '111', created_at: 111.seconds.ago }
  let!(:friend_112) { build :user, first_name: 'Friend', last_name: '112', created_at: 112.seconds.ago }
  let!(:friend_113) { build :user, first_name: 'Friend', last_name: '113', created_at: 113.seconds.ago }
  let!(:friend_114) { build :user, first_name: 'Friend', last_name: '114', created_at: 114.seconds.ago }
  let!(:friend_115) { build :user, first_name: 'Friend', last_name: '115', created_at: 115.seconds.ago }
  let!(:friend_116) { build :user, first_name: 'Friend', last_name: '116', created_at: 116.seconds.ago }
  let!(:friend_117) { build :user, first_name: 'Friend', last_name: '117', created_at: 117.seconds.ago }
  let!(:friend_118) { build :user, first_name: 'Friend', last_name: '118', created_at: 118.seconds.ago }
  let!(:friend_119) { build :user, first_name: 'Friend', last_name: '119', created_at: 119.seconds.ago }
  let!(:friend_120) { build :user, first_name: 'Friend', last_name: '120', created_at: 120.seconds.ago }

  before do
    120.times do |time|
      send(("friend_#{time+1}").to_sym).save(validate: false)
      create :friend_request, user: user, friend: send(("friend_#{time+1}").to_sym)
      create :friend_request, friend: user, user: send(("friend_#{time+1}").to_sym)
    end
  end

  context 'not signed in' do
    before { visit friends_path }

    it { expect(current_path).to eq new_user_session_path }
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit friends_path
    end

    it 'should show the number' do
      expect(page).to have_content 'Friends (120)'
    end
  end
end
