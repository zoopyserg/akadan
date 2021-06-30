require 'rails_helper'

RSpec.feature "Index Connections Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user }

  let!(:connection_1) { create :connection, name: 'Connection 1', user: user, is_public: false, created_at: 1.seconds.ago }
  let!(:connection_2) { create :connection, name: 'Connection 2', user: user, is_public: false, created_at: 2.seconds.ago }
  let!(:connection_3) { create :connection, name: 'Connection 3', user: user, is_public: false, created_at: 3.seconds.ago }
  let!(:connection_4) { create :connection, name: 'Connection 4', user: user, is_public: false, created_at: 4.seconds.ago }
  let!(:connection_5) { create :connection, name: 'Connection 5', user: user, is_public: false, created_at: 5.seconds.ago }
  let!(:connection_6) { create :connection, name: 'Connection 6', user: user, is_public: false, created_at: 6.seconds.ago }
  let!(:connection_7) { create :connection, name: 'Connection 7', user: user, is_public: false, created_at: 7.seconds.ago }
  let!(:connection_8) { create :connection, name: 'Connection 8', user: user, is_public: false, created_at: 8.seconds.ago }
  let!(:connection_9) { create :connection, name: 'Connection 9', user: user, is_public: false, created_at: 9.seconds.ago }
  let!(:connection_10) { create :connection, name: 'Connection 10', user: user, is_public: false, created_at: 10.seconds.ago }
  let!(:connection_11) { create :connection, name: 'Connection 11', user: user, is_public: false, created_at: 11.seconds.ago }
  let!(:connection_12) { create :connection, name: 'Connection 12', user: user, is_public: false, created_at: 12.seconds.ago }
  let!(:connection_13) { create :connection, name: 'Connection 13', user: user, is_public: false, created_at: 13.seconds.ago }
  let!(:connection_14) { create :connection, name: 'Connection 14', user: user, is_public: false, created_at: 14.seconds.ago }
  let!(:connection_15) { create :connection, name: 'Connection 15', user: user, is_public: false, created_at: 15.seconds.ago }
  let!(:connection_16) { create :connection, name: 'Connection 16', user: user, is_public: false, created_at: 16.seconds.ago }
  let!(:connection_17) { create :connection, name: 'Connection 17', user: user, is_public: false, created_at: 17.seconds.ago }
  let!(:connection_18) { create :connection, name: 'Connection 18', user: user, is_public: false, created_at: 18.seconds.ago }
  let!(:connection_19) { create :connection, name: 'Connection 19', user: user, is_public: false, created_at: 19.seconds.ago }
  let!(:connection_20) { create :connection, name: 'Connection 20', user: user, is_public: false, created_at: 20.seconds.ago }
  let!(:connection_21) { create :connection, name: 'Connection 21', user: user, is_public: false, created_at: 21.seconds.ago }
  let!(:connection_22) { create :connection, name: 'Connection 22', user: user, is_public: false, created_at: 22.seconds.ago }
  let!(:connection_23) { create :connection, name: 'Connection 23', user: user, is_public: false, created_at: 23.seconds.ago }
  let!(:connection_24) { create :connection, name: 'Connection 24', user: user, is_public: false, created_at: 24.seconds.ago }
  let!(:connection_25) { create :connection, name: 'Connection 25', user: user, is_public: false, created_at: 25.seconds.ago }
  let!(:connection_26) { create :connection, name: 'Connection 26', user: user, is_public: false, created_at: 26.seconds.ago }
  let!(:connection_27) { create :connection, name: 'Connection 27', user: user, is_public: false, created_at: 27.seconds.ago }
  let!(:connection_28) { create :connection, name: 'Connection 28', user: user, is_public: false, created_at: 28.seconds.ago }
  let!(:connection_29) { create :connection, name: 'Connection 29', user: user, is_public: false, created_at: 29.seconds.ago }
  let!(:connection_30) { create :connection, name: 'Connection 30', user: user, is_public: false, created_at: 30.seconds.ago }
  let!(:connection_31) { create :connection, name: 'Connection 31', user: user, is_public: true, created_at: 31.seconds.ago }
  let!(:connection_32) { create :connection, name: 'Connection 32', user: user, is_public: true, created_at: 32.seconds.ago }
  let!(:connection_33) { create :connection, name: 'Connection 33', user: user, is_public: true, created_at: 33.seconds.ago }
  let!(:connection_34) { create :connection, name: 'Connection 34', user: user, is_public: true, created_at: 34.seconds.ago }
  let!(:connection_35) { create :connection, name: 'Connection 35', user: user, is_public: true, created_at: 35.seconds.ago }
  let!(:connection_36) { create :connection, name: 'Connection 36', user: user, is_public: true, created_at: 36.seconds.ago }
  let!(:connection_37) { create :connection, name: 'Connection 37', user: user, is_public: true, created_at: 37.seconds.ago }
  let!(:connection_38) { create :connection, name: 'Connection 38', user: user, is_public: true, created_at: 38.seconds.ago }
  let!(:connection_39) { create :connection, name: 'Connection 39', user: user, is_public: true, created_at: 39.seconds.ago }
  let!(:connection_40) { create :connection, name: 'Connection 40', user: user, is_public: true, created_at: 40.seconds.ago }
  let!(:connection_41) { create :connection, name: 'Connection 41', user: user, is_public: true, created_at: 41.seconds.ago }
  let!(:connection_42) { create :connection, name: 'Connection 42', user: user, is_public: true, created_at: 42.seconds.ago }
  let!(:connection_43) { create :connection, name: 'Connection 43', user: user, is_public: true, created_at: 43.seconds.ago }
  let!(:connection_44) { create :connection, name: 'Connection 44', user: user, is_public: true, created_at: 44.seconds.ago }
  let!(:connection_45) { create :connection, name: 'Connection 45', user: user, is_public: true, created_at: 45.seconds.ago }
  let!(:connection_46) { create :connection, name: 'Connection 46', user: user, is_public: true, created_at: 46.seconds.ago }
  let!(:connection_47) { create :connection, name: 'Connection 47', user: user, is_public: true, created_at: 47.seconds.ago }
  let!(:connection_48) { create :connection, name: 'Connection 48', user: user, is_public: true, created_at: 48.seconds.ago }
  let!(:connection_49) { create :connection, name: 'Connection 49', user: user, is_public: true, created_at: 49.seconds.ago }
  let!(:connection_50) { create :connection, name: 'Connection 50', user: user, is_public: true, created_at: 50.seconds.ago }
  let!(:connection_51) { create :connection, name: 'Connection 51', user: user, is_public: true, created_at: 51.seconds.ago }
  let!(:connection_52) { create :connection, name: 'Connection 52', user: user, is_public: true, created_at: 52.seconds.ago }
  let!(:connection_53) { create :connection, name: 'Connection 53', user: user, is_public: true, created_at: 53.seconds.ago }
  let!(:connection_54) { create :connection, name: 'Connection 54', user: user, is_public: true, created_at: 54.seconds.ago }
  let!(:connection_55) { create :connection, name: 'Connection 55', user: user, is_public: true, created_at: 55.seconds.ago }
  let!(:connection_56) { create :connection, name: 'Connection 56', user: user, is_public: true, created_at: 56.seconds.ago }
  let!(:connection_57) { create :connection, name: 'Connection 57', user: user, is_public: true, created_at: 57.seconds.ago }
  let!(:connection_58) { create :connection, name: 'Connection 58', user: user, is_public: true, created_at: 58.seconds.ago }
  let!(:connection_59) { create :connection, name: 'Connection 59', user: user, is_public: true, created_at: 59.seconds.ago }
  let!(:connection_60) { create :connection, name: 'Connection 60', user: user, is_public: true, created_at: 60.seconds.ago }
  let!(:connection_61) { create :connection, name: 'Connection 61', user: user2, is_public: false, created_at: 61.seconds.ago }
  let!(:connection_62) { create :connection, name: 'Connection 62', user: user2, is_public: false, created_at: 62.seconds.ago }
  let!(:connection_63) { create :connection, name: 'Connection 63', user: user2, is_public: false, created_at: 63.seconds.ago }
  let!(:connection_64) { create :connection, name: 'Connection 64', user: user2, is_public: false, created_at: 64.seconds.ago }
  let!(:connection_65) { create :connection, name: 'Connection 65', user: user2, is_public: false, created_at: 65.seconds.ago }
  let!(:connection_66) { create :connection, name: 'Connection 66', user: user2, is_public: false, created_at: 66.seconds.ago }
  let!(:connection_67) { create :connection, name: 'Connection 67', user: user2, is_public: false, created_at: 67.seconds.ago }
  let!(:connection_68) { create :connection, name: 'Connection 68', user: user2, is_public: false, created_at: 68.seconds.ago }
  let!(:connection_69) { create :connection, name: 'Connection 69', user: user2, is_public: false, created_at: 69.seconds.ago }
  let!(:connection_70) { create :connection, name: 'Connection 70', user: user2, is_public: false, created_at: 70.seconds.ago }
  let!(:connection_71) { create :connection, name: 'Connection 71', user: user2, is_public: false, created_at: 71.seconds.ago }
  let!(:connection_72) { create :connection, name: 'Connection 72', user: user2, is_public: false, created_at: 72.seconds.ago }
  let!(:connection_73) { create :connection, name: 'Connection 73', user: user2, is_public: false, created_at: 73.seconds.ago }
  let!(:connection_74) { create :connection, name: 'Connection 74', user: user2, is_public: false, created_at: 74.seconds.ago }
  let!(:connection_75) { create :connection, name: 'Connection 75', user: user2, is_public: false, created_at: 75.seconds.ago }
  let!(:connection_76) { create :connection, name: 'Connection 76', user: user2, is_public: false, created_at: 76.seconds.ago }
  let!(:connection_77) { create :connection, name: 'Connection 77', user: user2, is_public: false, created_at: 77.seconds.ago }
  let!(:connection_78) { create :connection, name: 'Connection 78', user: user2, is_public: false, created_at: 78.seconds.ago }
  let!(:connection_79) { create :connection, name: 'Connection 79', user: user2, is_public: false, created_at: 79.seconds.ago }
  let!(:connection_80) { create :connection, name: 'Connection 80', user: user2, is_public: false, created_at: 80.seconds.ago }
  let!(:connection_81) { create :connection, name: 'Connection 81', user: user2, is_public: false, created_at: 81.seconds.ago }
  let!(:connection_82) { create :connection, name: 'Connection 82', user: user2, is_public: false, created_at: 82.seconds.ago }
  let!(:connection_83) { create :connection, name: 'Connection 83', user: user2, is_public: false, created_at: 83.seconds.ago }
  let!(:connection_84) { create :connection, name: 'Connection 84', user: user2, is_public: false, created_at: 84.seconds.ago }
  let!(:connection_85) { create :connection, name: 'Connection 85', user: user2, is_public: false, created_at: 85.seconds.ago }
  let!(:connection_86) { create :connection, name: 'Connection 86', user: user2, is_public: false, created_at: 86.seconds.ago }
  let!(:connection_87) { create :connection, name: 'Connection 87', user: user2, is_public: false, created_at: 87.seconds.ago }
  let!(:connection_88) { create :connection, name: 'Connection 88', user: user2, is_public: false, created_at: 88.seconds.ago }
  let!(:connection_89) { create :connection, name: 'Connection 89', user: user2, is_public: false, created_at: 89.seconds.ago }
  let!(:connection_90) { create :connection, name: 'Connection 90', user: user2, is_public: false, created_at: 90.seconds.ago }
  let!(:connection_91) { create :connection, name: 'Connection 91', user: user2, is_public: true, created_at: 91.seconds.ago }
  let!(:connection_92) { create :connection, name: 'Connection 92', user: user2, is_public: true, created_at: 92.seconds.ago }
  let!(:connection_93) { create :connection, name: 'Connection 93', user: user2, is_public: true, created_at: 93.seconds.ago }
  let!(:connection_94) { create :connection, name: 'Connection 94', user: user2, is_public: true, created_at: 94.seconds.ago }
  let!(:connection_95) { create :connection, name: 'Connection 95', user: user2, is_public: true, created_at: 95.seconds.ago }
  let!(:connection_96) { create :connection, name: 'Connection 96', user: user2, is_public: true, created_at: 96.seconds.ago }
  let!(:connection_97) { create :connection, name: 'Connection 97', user: user2, is_public: true, created_at: 97.seconds.ago }
  let!(:connection_98) { create :connection, name: 'Connection 98', user: user2, is_public: true, created_at: 98.seconds.ago }
  let!(:connection_99) { create :connection, name: 'Connection 99', user: user2, is_public: true, created_at: 99.seconds.ago }
  let!(:connection_100) { create :connection, name: 'Connection 100', user: user2, is_public: true, created_at: 100.seconds.ago }
  let!(:connection_101) { create :connection, name: 'Connection 101', user: user2, is_public: true, created_at: 101.seconds.ago }
  let!(:connection_102) { create :connection, name: 'Connection 102', user: user2, is_public: true, created_at: 102.seconds.ago }
  let!(:connection_103) { create :connection, name: 'Connection 103', user: user2, is_public: true, created_at: 103.seconds.ago }
  let!(:connection_104) { create :connection, name: 'Connection 104', user: user2, is_public: true, created_at: 104.seconds.ago }
  let!(:connection_105) { create :connection, name: 'Connection 105', user: user2, is_public: true, created_at: 105.seconds.ago }
  let!(:connection_106) { create :connection, name: 'Connection 106', user: user2, is_public: true, created_at: 106.seconds.ago }
  let!(:connection_107) { create :connection, name: 'Connection 107', user: user2, is_public: true, created_at: 107.seconds.ago }
  let!(:connection_108) { create :connection, name: 'Connection 108', user: user2, is_public: true, created_at: 108.seconds.ago }
  let!(:connection_109) { create :connection, name: 'Connection 109', user: user2, is_public: true, created_at: 109.seconds.ago }
  let!(:connection_110) { create :connection, name: 'Connection 110', user: user2, is_public: true, created_at: 110.seconds.ago }
  let!(:connection_111) { create :connection, name: 'Connection 111', user: user2, is_public: true, created_at: 111.seconds.ago }
  let!(:connection_112) { create :connection, name: 'Connection 112', user: user2, is_public: true, created_at: 112.seconds.ago }
  let!(:connection_113) { create :connection, name: 'Connection 113', user: user2, is_public: true, created_at: 113.seconds.ago }
  let!(:connection_114) { create :connection, name: 'Connection 114', user: user2, is_public: true, created_at: 114.seconds.ago }
  let!(:connection_115) { create :connection, name: 'Connection 115', user: user2, is_public: true, created_at: 115.seconds.ago }
  let!(:connection_116) { create :connection, name: 'Connection 116', user: user2, is_public: true, created_at: 116.seconds.ago }
  let!(:connection_117) { create :connection, name: 'Connection 117', user: user2, is_public: true, created_at: 117.seconds.ago }
  let!(:connection_118) { create :connection, name: 'Connection 118', user: user2, is_public: true, created_at: 118.seconds.ago }
  let!(:connection_119) { create :connection, name: 'Connection 119', user: user2, is_public: true, created_at: 119.seconds.ago }
  let!(:connection_120) { create :connection, name: 'Connection 120', user: user2, is_public: true, created_at: 120.seconds.ago }

  context 'not signed in' do
    context 'page 1' do
      before { visit connections_path }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 31', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 32', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 33', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 34', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 35', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 36', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 37', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 38', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 39', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 40', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 41', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 42', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 43', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 44', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 45', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 46', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 47', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 48', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 49', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit connections_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 50', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit connections_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
    end

    context 'page 1' do
      before { visit connections_path }

      it 'should display only first 20 public records' do
        expect(page).to have_css 'h5', text: 'Connection 1', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 2', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 3', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 4', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 5', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 6', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 7', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 8', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 9', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 10', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 11', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 12', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 13', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 14', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 15', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 16', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 17', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 18', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 19', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit connections_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 21', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 22', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 23', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 24', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 25', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 26', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 27', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 28', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 29', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 30', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 31', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 32', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 33', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 34', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 35', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 36', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 37', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 38', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 39', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit connections_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 40', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 41', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 42', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 43', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 44', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 45', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 46', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 47', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 48', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 49', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 50', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 4' do
      before { visit connections_path }
      before { click_on '4', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 5' do
      before { visit connections_path }
      before { click_on '5', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection 120', exact_text: true # still public but wrong page
      end
    end

  end

end
