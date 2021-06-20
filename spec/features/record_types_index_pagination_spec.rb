require 'rails_helper'

RSpec.feature "Index Record Types Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user }

  let!(:record_type_1) { create :record_type, name: 'Record Type 1', user: user, is_public: false, created_at: 1.seconds.ago }
  let!(:record_type_2) { create :record_type, name: 'Record Type 2', user: user, is_public: false, created_at: 2.seconds.ago }
  let!(:record_type_3) { create :record_type, name: 'Record Type 3', user: user, is_public: false, created_at: 3.seconds.ago }
  let!(:record_type_4) { create :record_type, name: 'Record Type 4', user: user, is_public: false, created_at: 4.seconds.ago }
  let!(:record_type_5) { create :record_type, name: 'Record Type 5', user: user, is_public: false, created_at: 5.seconds.ago }
  let!(:record_type_6) { create :record_type, name: 'Record Type 6', user: user, is_public: false, created_at: 6.seconds.ago }
  let!(:record_type_7) { create :record_type, name: 'Record Type 7', user: user, is_public: false, created_at: 7.seconds.ago }
  let!(:record_type_8) { create :record_type, name: 'Record Type 8', user: user, is_public: false, created_at: 8.seconds.ago }
  let!(:record_type_9) { create :record_type, name: 'Record Type 9', user: user, is_public: false, created_at: 9.seconds.ago }
  let!(:record_type_10) { create :record_type, name: 'Record Type 10', user: user, is_public: false, created_at: 10.seconds.ago }
  let!(:record_type_11) { create :record_type, name: 'Record Type 11', user: user, is_public: false, created_at: 11.seconds.ago }
  let!(:record_type_12) { create :record_type, name: 'Record Type 12', user: user, is_public: false, created_at: 12.seconds.ago }
  let!(:record_type_13) { create :record_type, name: 'Record Type 13', user: user, is_public: false, created_at: 13.seconds.ago }
  let!(:record_type_14) { create :record_type, name: 'Record Type 14', user: user, is_public: false, created_at: 14.seconds.ago }
  let!(:record_type_15) { create :record_type, name: 'Record Type 15', user: user, is_public: false, created_at: 15.seconds.ago }
  let!(:record_type_16) { create :record_type, name: 'Record Type 16', user: user, is_public: false, created_at: 16.seconds.ago }
  let!(:record_type_17) { create :record_type, name: 'Record Type 17', user: user, is_public: false, created_at: 17.seconds.ago }
  let!(:record_type_18) { create :record_type, name: 'Record Type 18', user: user, is_public: false, created_at: 18.seconds.ago }
  let!(:record_type_19) { create :record_type, name: 'Record Type 19', user: user, is_public: false, created_at: 19.seconds.ago }
  let!(:record_type_20) { create :record_type, name: 'Record Type 20', user: user, is_public: false, created_at: 20.seconds.ago }
  let!(:record_type_21) { create :record_type, name: 'Record Type 21', user: user, is_public: false, created_at: 21.seconds.ago }
  let!(:record_type_22) { create :record_type, name: 'Record Type 22', user: user, is_public: false, created_at: 22.seconds.ago }
  let!(:record_type_23) { create :record_type, name: 'Record Type 23', user: user, is_public: false, created_at: 23.seconds.ago }
  let!(:record_type_24) { create :record_type, name: 'Record Type 24', user: user, is_public: false, created_at: 24.seconds.ago }
  let!(:record_type_25) { create :record_type, name: 'Record Type 25', user: user, is_public: false, created_at: 25.seconds.ago }
  let!(:record_type_26) { create :record_type, name: 'Record Type 26', user: user, is_public: false, created_at: 26.seconds.ago }
  let!(:record_type_27) { create :record_type, name: 'Record Type 27', user: user, is_public: false, created_at: 27.seconds.ago }
  let!(:record_type_28) { create :record_type, name: 'Record Type 28', user: user, is_public: false, created_at: 28.seconds.ago }
  let!(:record_type_29) { create :record_type, name: 'Record Type 29', user: user, is_public: false, created_at: 29.seconds.ago }
  let!(:record_type_30) { create :record_type, name: 'Record Type 30', user: user, is_public: false, created_at: 30.seconds.ago }
  let!(:record_type_31) { create :record_type, name: 'Record Type 31', user: user, is_public: true, created_at: 31.seconds.ago }
  let!(:record_type_32) { create :record_type, name: 'Record Type 32', user: user, is_public: true, created_at: 32.seconds.ago }
  let!(:record_type_33) { create :record_type, name: 'Record Type 33', user: user, is_public: true, created_at: 33.seconds.ago }
  let!(:record_type_34) { create :record_type, name: 'Record Type 34', user: user, is_public: true, created_at: 34.seconds.ago }
  let!(:record_type_35) { create :record_type, name: 'Record Type 35', user: user, is_public: true, created_at: 35.seconds.ago }
  let!(:record_type_36) { create :record_type, name: 'Record Type 36', user: user, is_public: true, created_at: 36.seconds.ago }
  let!(:record_type_37) { create :record_type, name: 'Record Type 37', user: user, is_public: true, created_at: 37.seconds.ago }
  let!(:record_type_38) { create :record_type, name: 'Record Type 38', user: user, is_public: true, created_at: 38.seconds.ago }
  let!(:record_type_39) { create :record_type, name: 'Record Type 39', user: user, is_public: true, created_at: 39.seconds.ago }
  let!(:record_type_40) { create :record_type, name: 'Record Type 40', user: user, is_public: true, created_at: 40.seconds.ago }
  let!(:record_type_41) { create :record_type, name: 'Record Type 41', user: user, is_public: true, created_at: 41.seconds.ago }
  let!(:record_type_42) { create :record_type, name: 'Record Type 42', user: user, is_public: true, created_at: 42.seconds.ago }
  let!(:record_type_43) { create :record_type, name: 'Record Type 43', user: user, is_public: true, created_at: 43.seconds.ago }
  let!(:record_type_44) { create :record_type, name: 'Record Type 44', user: user, is_public: true, created_at: 44.seconds.ago }
  let!(:record_type_45) { create :record_type, name: 'Record Type 45', user: user, is_public: true, created_at: 45.seconds.ago }
  let!(:record_type_46) { create :record_type, name: 'Record Type 46', user: user, is_public: true, created_at: 46.seconds.ago }
  let!(:record_type_47) { create :record_type, name: 'Record Type 47', user: user, is_public: true, created_at: 47.seconds.ago }
  let!(:record_type_48) { create :record_type, name: 'Record Type 48', user: user, is_public: true, created_at: 48.seconds.ago }
  let!(:record_type_49) { create :record_type, name: 'Record Type 49', user: user, is_public: true, created_at: 49.seconds.ago }
  let!(:record_type_50) { create :record_type, name: 'Record Type 50', user: user, is_public: true, created_at: 50.seconds.ago }
  let!(:record_type_51) { create :record_type, name: 'Record Type 51', user: user, is_public: true, created_at: 51.seconds.ago }
  let!(:record_type_52) { create :record_type, name: 'Record Type 52', user: user, is_public: true, created_at: 52.seconds.ago }
  let!(:record_type_53) { create :record_type, name: 'Record Type 53', user: user, is_public: true, created_at: 53.seconds.ago }
  let!(:record_type_54) { create :record_type, name: 'Record Type 54', user: user, is_public: true, created_at: 54.seconds.ago }
  let!(:record_type_55) { create :record_type, name: 'Record Type 55', user: user, is_public: true, created_at: 55.seconds.ago }
  let!(:record_type_56) { create :record_type, name: 'Record Type 56', user: user, is_public: true, created_at: 56.seconds.ago }
  let!(:record_type_57) { create :record_type, name: 'Record Type 57', user: user, is_public: true, created_at: 57.seconds.ago }
  let!(:record_type_58) { create :record_type, name: 'Record Type 58', user: user, is_public: true, created_at: 58.seconds.ago }
  let!(:record_type_59) { create :record_type, name: 'Record Type 59', user: user, is_public: true, created_at: 59.seconds.ago }
  let!(:record_type_60) { create :record_type, name: 'Record Type 60', user: user, is_public: true, created_at: 60.seconds.ago }
  let!(:record_type_61) { create :record_type, name: 'Record Type 61', user: user2, is_public: false, created_at: 61.seconds.ago }
  let!(:record_type_62) { create :record_type, name: 'Record Type 62', user: user2, is_public: false, created_at: 62.seconds.ago }
  let!(:record_type_63) { create :record_type, name: 'Record Type 63', user: user2, is_public: false, created_at: 63.seconds.ago }
  let!(:record_type_64) { create :record_type, name: 'Record Type 64', user: user2, is_public: false, created_at: 64.seconds.ago }
  let!(:record_type_65) { create :record_type, name: 'Record Type 65', user: user2, is_public: false, created_at: 65.seconds.ago }
  let!(:record_type_66) { create :record_type, name: 'Record Type 66', user: user2, is_public: false, created_at: 66.seconds.ago }
  let!(:record_type_67) { create :record_type, name: 'Record Type 67', user: user2, is_public: false, created_at: 67.seconds.ago }
  let!(:record_type_68) { create :record_type, name: 'Record Type 68', user: user2, is_public: false, created_at: 68.seconds.ago }
  let!(:record_type_69) { create :record_type, name: 'Record Type 69', user: user2, is_public: false, created_at: 69.seconds.ago }
  let!(:record_type_70) { create :record_type, name: 'Record Type 70', user: user2, is_public: false, created_at: 70.seconds.ago }
  let!(:record_type_71) { create :record_type, name: 'Record Type 71', user: user2, is_public: false, created_at: 71.seconds.ago }
  let!(:record_type_72) { create :record_type, name: 'Record Type 72', user: user2, is_public: false, created_at: 72.seconds.ago }
  let!(:record_type_73) { create :record_type, name: 'Record Type 73', user: user2, is_public: false, created_at: 73.seconds.ago }
  let!(:record_type_74) { create :record_type, name: 'Record Type 74', user: user2, is_public: false, created_at: 74.seconds.ago }
  let!(:record_type_75) { create :record_type, name: 'Record Type 75', user: user2, is_public: false, created_at: 75.seconds.ago }
  let!(:record_type_76) { create :record_type, name: 'Record Type 76', user: user2, is_public: false, created_at: 76.seconds.ago }
  let!(:record_type_77) { create :record_type, name: 'Record Type 77', user: user2, is_public: false, created_at: 77.seconds.ago }
  let!(:record_type_78) { create :record_type, name: 'Record Type 78', user: user2, is_public: false, created_at: 78.seconds.ago }
  let!(:record_type_79) { create :record_type, name: 'Record Type 79', user: user2, is_public: false, created_at: 79.seconds.ago }
  let!(:record_type_80) { create :record_type, name: 'Record Type 80', user: user2, is_public: false, created_at: 80.seconds.ago }
  let!(:record_type_81) { create :record_type, name: 'Record Type 81', user: user2, is_public: false, created_at: 81.seconds.ago }
  let!(:record_type_82) { create :record_type, name: 'Record Type 82', user: user2, is_public: false, created_at: 82.seconds.ago }
  let!(:record_type_83) { create :record_type, name: 'Record Type 83', user: user2, is_public: false, created_at: 83.seconds.ago }
  let!(:record_type_84) { create :record_type, name: 'Record Type 84', user: user2, is_public: false, created_at: 84.seconds.ago }
  let!(:record_type_85) { create :record_type, name: 'Record Type 85', user: user2, is_public: false, created_at: 85.seconds.ago }
  let!(:record_type_86) { create :record_type, name: 'Record Type 86', user: user2, is_public: false, created_at: 86.seconds.ago }
  let!(:record_type_87) { create :record_type, name: 'Record Type 87', user: user2, is_public: false, created_at: 87.seconds.ago }
  let!(:record_type_88) { create :record_type, name: 'Record Type 88', user: user2, is_public: false, created_at: 88.seconds.ago }
  let!(:record_type_89) { create :record_type, name: 'Record Type 89', user: user2, is_public: false, created_at: 89.seconds.ago }
  let!(:record_type_90) { create :record_type, name: 'Record Type 90', user: user2, is_public: false, created_at: 90.seconds.ago }
  let!(:record_type_91) { create :record_type, name: 'Record Type 91', user: user2, is_public: true, created_at: 91.seconds.ago }
  let!(:record_type_92) { create :record_type, name: 'Record Type 92', user: user2, is_public: true, created_at: 92.seconds.ago }
  let!(:record_type_93) { create :record_type, name: 'Record Type 93', user: user2, is_public: true, created_at: 93.seconds.ago }
  let!(:record_type_94) { create :record_type, name: 'Record Type 94', user: user2, is_public: true, created_at: 94.seconds.ago }
  let!(:record_type_95) { create :record_type, name: 'Record Type 95', user: user2, is_public: true, created_at: 95.seconds.ago }
  let!(:record_type_96) { create :record_type, name: 'Record Type 96', user: user2, is_public: true, created_at: 96.seconds.ago }
  let!(:record_type_97) { create :record_type, name: 'Record Type 97', user: user2, is_public: true, created_at: 97.seconds.ago }
  let!(:record_type_98) { create :record_type, name: 'Record Type 98', user: user2, is_public: true, created_at: 98.seconds.ago }
  let!(:record_type_99) { create :record_type, name: 'Record Type 99', user: user2, is_public: true, created_at: 99.seconds.ago }
  let!(:record_type_100) { create :record_type, name: 'Record Type 100', user: user2, is_public: true, created_at: 100.seconds.ago }
  let!(:record_type_101) { create :record_type, name: 'Record Type 101', user: user2, is_public: true, created_at: 101.seconds.ago }
  let!(:record_type_102) { create :record_type, name: 'Record Type 102', user: user2, is_public: true, created_at: 102.seconds.ago }
  let!(:record_type_103) { create :record_type, name: 'Record Type 103', user: user2, is_public: true, created_at: 103.seconds.ago }
  let!(:record_type_104) { create :record_type, name: 'Record Type 104', user: user2, is_public: true, created_at: 104.seconds.ago }
  let!(:record_type_105) { create :record_type, name: 'Record Type 105', user: user2, is_public: true, created_at: 105.seconds.ago }
  let!(:record_type_106) { create :record_type, name: 'Record Type 106', user: user2, is_public: true, created_at: 106.seconds.ago }
  let!(:record_type_107) { create :record_type, name: 'Record Type 107', user: user2, is_public: true, created_at: 107.seconds.ago }
  let!(:record_type_108) { create :record_type, name: 'Record Type 108', user: user2, is_public: true, created_at: 108.seconds.ago }
  let!(:record_type_109) { create :record_type, name: 'Record Type 109', user: user2, is_public: true, created_at: 109.seconds.ago }
  let!(:record_type_110) { create :record_type, name: 'Record Type 110', user: user2, is_public: true, created_at: 110.seconds.ago }
  let!(:record_type_111) { create :record_type, name: 'Record Type 111', user: user2, is_public: true, created_at: 111.seconds.ago }
  let!(:record_type_112) { create :record_type, name: 'Record Type 112', user: user2, is_public: true, created_at: 112.seconds.ago }
  let!(:record_type_113) { create :record_type, name: 'Record Type 113', user: user2, is_public: true, created_at: 113.seconds.ago }
  let!(:record_type_114) { create :record_type, name: 'Record Type 114', user: user2, is_public: true, created_at: 114.seconds.ago }
  let!(:record_type_115) { create :record_type, name: 'Record Type 115', user: user2, is_public: true, created_at: 115.seconds.ago }
  let!(:record_type_116) { create :record_type, name: 'Record Type 116', user: user2, is_public: true, created_at: 116.seconds.ago }
  let!(:record_type_117) { create :record_type, name: 'Record Type 117', user: user2, is_public: true, created_at: 117.seconds.ago }
  let!(:record_type_118) { create :record_type, name: 'Record Type 118', user: user2, is_public: true, created_at: 118.seconds.ago }
  let!(:record_type_119) { create :record_type, name: 'Record Type 119', user: user2, is_public: true, created_at: 119.seconds.ago }
  let!(:record_type_120) { create :record_type, name: 'Record Type 120', user: user2, is_public: true, created_at: 120.seconds.ago }

  context 'not signed in' do
    context 'page 1' do
      before { visit record_types_path }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 31', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 32', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 33', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 34', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 35', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 36', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 37', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 38', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 39', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 40', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 41', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 42', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 43', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 44', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 45', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 46', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 47', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 48', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 49', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit record_types_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 50', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit record_types_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
    end

    context 'page 1' do
      before { visit record_types_path }

      it 'should display only first 20 public records' do
        expect(page).to have_css 'h5', text: 'Record Type 1', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 2', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 3', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 4', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 5', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 6', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 7', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 8', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 9', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 10', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 11', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 12', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 13', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 14', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 15', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 16', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 17', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 18', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 19', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit record_types_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 21', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 22', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 23', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 24', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 25', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 26', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 27', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 28', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 29', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 30', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 31', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 32', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 33', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 34', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 35', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 36', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 37', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 38', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 39', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit record_types_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 40', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 41', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 42', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 43', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 44', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 45', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 46', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 47', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 48', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 49', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 50', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 4' do
      before { visit record_types_path }
      before { click_on '4', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 5' do
      before { visit record_types_path }
      before { click_on '5', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Record Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Record Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Record Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Record Type 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Record Type 120', exact_text: true # still public but wrong page
      end
    end

  end

end
