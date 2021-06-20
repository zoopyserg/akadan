require 'rails_helper'

RSpec.feature "Index Sensors Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user }

  let!(:sensor_1) { create :sensor, name: 'Sensor 1', user: user, is_public: false, created_at: 1.seconds.ago }
  let!(:sensor_2) { create :sensor, name: 'Sensor 2', user: user, is_public: false, created_at: 2.seconds.ago }
  let!(:sensor_3) { create :sensor, name: 'Sensor 3', user: user, is_public: false, created_at: 3.seconds.ago }
  let!(:sensor_4) { create :sensor, name: 'Sensor 4', user: user, is_public: false, created_at: 4.seconds.ago }
  let!(:sensor_5) { create :sensor, name: 'Sensor 5', user: user, is_public: false, created_at: 5.seconds.ago }
  let!(:sensor_6) { create :sensor, name: 'Sensor 6', user: user, is_public: false, created_at: 6.seconds.ago }
  let!(:sensor_7) { create :sensor, name: 'Sensor 7', user: user, is_public: false, created_at: 7.seconds.ago }
  let!(:sensor_8) { create :sensor, name: 'Sensor 8', user: user, is_public: false, created_at: 8.seconds.ago }
  let!(:sensor_9) { create :sensor, name: 'Sensor 9', user: user, is_public: false, created_at: 9.seconds.ago }
  let!(:sensor_10) { create :sensor, name: 'Sensor 10', user: user, is_public: false, created_at: 10.seconds.ago }
  let!(:sensor_11) { create :sensor, name: 'Sensor 11', user: user, is_public: false, created_at: 11.seconds.ago }
  let!(:sensor_12) { create :sensor, name: 'Sensor 12', user: user, is_public: false, created_at: 12.seconds.ago }
  let!(:sensor_13) { create :sensor, name: 'Sensor 13', user: user, is_public: false, created_at: 13.seconds.ago }
  let!(:sensor_14) { create :sensor, name: 'Sensor 14', user: user, is_public: false, created_at: 14.seconds.ago }
  let!(:sensor_15) { create :sensor, name: 'Sensor 15', user: user, is_public: false, created_at: 15.seconds.ago }
  let!(:sensor_16) { create :sensor, name: 'Sensor 16', user: user, is_public: false, created_at: 16.seconds.ago }
  let!(:sensor_17) { create :sensor, name: 'Sensor 17', user: user, is_public: false, created_at: 17.seconds.ago }
  let!(:sensor_18) { create :sensor, name: 'Sensor 18', user: user, is_public: false, created_at: 18.seconds.ago }
  let!(:sensor_19) { create :sensor, name: 'Sensor 19', user: user, is_public: false, created_at: 19.seconds.ago }
  let!(:sensor_20) { create :sensor, name: 'Sensor 20', user: user, is_public: false, created_at: 20.seconds.ago }
  let!(:sensor_21) { create :sensor, name: 'Sensor 21', user: user, is_public: false, created_at: 21.seconds.ago }
  let!(:sensor_22) { create :sensor, name: 'Sensor 22', user: user, is_public: false, created_at: 22.seconds.ago }
  let!(:sensor_23) { create :sensor, name: 'Sensor 23', user: user, is_public: false, created_at: 23.seconds.ago }
  let!(:sensor_24) { create :sensor, name: 'Sensor 24', user: user, is_public: false, created_at: 24.seconds.ago }
  let!(:sensor_25) { create :sensor, name: 'Sensor 25', user: user, is_public: false, created_at: 25.seconds.ago }
  let!(:sensor_26) { create :sensor, name: 'Sensor 26', user: user, is_public: false, created_at: 26.seconds.ago }
  let!(:sensor_27) { create :sensor, name: 'Sensor 27', user: user, is_public: false, created_at: 27.seconds.ago }
  let!(:sensor_28) { create :sensor, name: 'Sensor 28', user: user, is_public: false, created_at: 28.seconds.ago }
  let!(:sensor_29) { create :sensor, name: 'Sensor 29', user: user, is_public: false, created_at: 29.seconds.ago }
  let!(:sensor_30) { create :sensor, name: 'Sensor 30', user: user, is_public: false, created_at: 30.seconds.ago }
  let!(:sensor_31) { create :sensor, name: 'Sensor 31', user: user, is_public: true, created_at: 31.seconds.ago }
  let!(:sensor_32) { create :sensor, name: 'Sensor 32', user: user, is_public: true, created_at: 32.seconds.ago }
  let!(:sensor_33) { create :sensor, name: 'Sensor 33', user: user, is_public: true, created_at: 33.seconds.ago }
  let!(:sensor_34) { create :sensor, name: 'Sensor 34', user: user, is_public: true, created_at: 34.seconds.ago }
  let!(:sensor_35) { create :sensor, name: 'Sensor 35', user: user, is_public: true, created_at: 35.seconds.ago }
  let!(:sensor_36) { create :sensor, name: 'Sensor 36', user: user, is_public: true, created_at: 36.seconds.ago }
  let!(:sensor_37) { create :sensor, name: 'Sensor 37', user: user, is_public: true, created_at: 37.seconds.ago }
  let!(:sensor_38) { create :sensor, name: 'Sensor 38', user: user, is_public: true, created_at: 38.seconds.ago }
  let!(:sensor_39) { create :sensor, name: 'Sensor 39', user: user, is_public: true, created_at: 39.seconds.ago }
  let!(:sensor_40) { create :sensor, name: 'Sensor 40', user: user, is_public: true, created_at: 40.seconds.ago }
  let!(:sensor_41) { create :sensor, name: 'Sensor 41', user: user, is_public: true, created_at: 41.seconds.ago }
  let!(:sensor_42) { create :sensor, name: 'Sensor 42', user: user, is_public: true, created_at: 42.seconds.ago }
  let!(:sensor_43) { create :sensor, name: 'Sensor 43', user: user, is_public: true, created_at: 43.seconds.ago }
  let!(:sensor_44) { create :sensor, name: 'Sensor 44', user: user, is_public: true, created_at: 44.seconds.ago }
  let!(:sensor_45) { create :sensor, name: 'Sensor 45', user: user, is_public: true, created_at: 45.seconds.ago }
  let!(:sensor_46) { create :sensor, name: 'Sensor 46', user: user, is_public: true, created_at: 46.seconds.ago }
  let!(:sensor_47) { create :sensor, name: 'Sensor 47', user: user, is_public: true, created_at: 47.seconds.ago }
  let!(:sensor_48) { create :sensor, name: 'Sensor 48', user: user, is_public: true, created_at: 48.seconds.ago }
  let!(:sensor_49) { create :sensor, name: 'Sensor 49', user: user, is_public: true, created_at: 49.seconds.ago }
  let!(:sensor_50) { create :sensor, name: 'Sensor 50', user: user, is_public: true, created_at: 50.seconds.ago }
  let!(:sensor_51) { create :sensor, name: 'Sensor 51', user: user, is_public: true, created_at: 51.seconds.ago }
  let!(:sensor_52) { create :sensor, name: 'Sensor 52', user: user, is_public: true, created_at: 52.seconds.ago }
  let!(:sensor_53) { create :sensor, name: 'Sensor 53', user: user, is_public: true, created_at: 53.seconds.ago }
  let!(:sensor_54) { create :sensor, name: 'Sensor 54', user: user, is_public: true, created_at: 54.seconds.ago }
  let!(:sensor_55) { create :sensor, name: 'Sensor 55', user: user, is_public: true, created_at: 55.seconds.ago }
  let!(:sensor_56) { create :sensor, name: 'Sensor 56', user: user, is_public: true, created_at: 56.seconds.ago }
  let!(:sensor_57) { create :sensor, name: 'Sensor 57', user: user, is_public: true, created_at: 57.seconds.ago }
  let!(:sensor_58) { create :sensor, name: 'Sensor 58', user: user, is_public: true, created_at: 58.seconds.ago }
  let!(:sensor_59) { create :sensor, name: 'Sensor 59', user: user, is_public: true, created_at: 59.seconds.ago }
  let!(:sensor_60) { create :sensor, name: 'Sensor 60', user: user, is_public: true, created_at: 60.seconds.ago }
  let!(:sensor_61) { create :sensor, name: 'Sensor 61', user: user2, is_public: false, created_at: 61.seconds.ago }
  let!(:sensor_62) { create :sensor, name: 'Sensor 62', user: user2, is_public: false, created_at: 62.seconds.ago }
  let!(:sensor_63) { create :sensor, name: 'Sensor 63', user: user2, is_public: false, created_at: 63.seconds.ago }
  let!(:sensor_64) { create :sensor, name: 'Sensor 64', user: user2, is_public: false, created_at: 64.seconds.ago }
  let!(:sensor_65) { create :sensor, name: 'Sensor 65', user: user2, is_public: false, created_at: 65.seconds.ago }
  let!(:sensor_66) { create :sensor, name: 'Sensor 66', user: user2, is_public: false, created_at: 66.seconds.ago }
  let!(:sensor_67) { create :sensor, name: 'Sensor 67', user: user2, is_public: false, created_at: 67.seconds.ago }
  let!(:sensor_68) { create :sensor, name: 'Sensor 68', user: user2, is_public: false, created_at: 68.seconds.ago }
  let!(:sensor_69) { create :sensor, name: 'Sensor 69', user: user2, is_public: false, created_at: 69.seconds.ago }
  let!(:sensor_70) { create :sensor, name: 'Sensor 70', user: user2, is_public: false, created_at: 70.seconds.ago }
  let!(:sensor_71) { create :sensor, name: 'Sensor 71', user: user2, is_public: false, created_at: 71.seconds.ago }
  let!(:sensor_72) { create :sensor, name: 'Sensor 72', user: user2, is_public: false, created_at: 72.seconds.ago }
  let!(:sensor_73) { create :sensor, name: 'Sensor 73', user: user2, is_public: false, created_at: 73.seconds.ago }
  let!(:sensor_74) { create :sensor, name: 'Sensor 74', user: user2, is_public: false, created_at: 74.seconds.ago }
  let!(:sensor_75) { create :sensor, name: 'Sensor 75', user: user2, is_public: false, created_at: 75.seconds.ago }
  let!(:sensor_76) { create :sensor, name: 'Sensor 76', user: user2, is_public: false, created_at: 76.seconds.ago }
  let!(:sensor_77) { create :sensor, name: 'Sensor 77', user: user2, is_public: false, created_at: 77.seconds.ago }
  let!(:sensor_78) { create :sensor, name: 'Sensor 78', user: user2, is_public: false, created_at: 78.seconds.ago }
  let!(:sensor_79) { create :sensor, name: 'Sensor 79', user: user2, is_public: false, created_at: 79.seconds.ago }
  let!(:sensor_80) { create :sensor, name: 'Sensor 80', user: user2, is_public: false, created_at: 80.seconds.ago }
  let!(:sensor_81) { create :sensor, name: 'Sensor 81', user: user2, is_public: false, created_at: 81.seconds.ago }
  let!(:sensor_82) { create :sensor, name: 'Sensor 82', user: user2, is_public: false, created_at: 82.seconds.ago }
  let!(:sensor_83) { create :sensor, name: 'Sensor 83', user: user2, is_public: false, created_at: 83.seconds.ago }
  let!(:sensor_84) { create :sensor, name: 'Sensor 84', user: user2, is_public: false, created_at: 84.seconds.ago }
  let!(:sensor_85) { create :sensor, name: 'Sensor 85', user: user2, is_public: false, created_at: 85.seconds.ago }
  let!(:sensor_86) { create :sensor, name: 'Sensor 86', user: user2, is_public: false, created_at: 86.seconds.ago }
  let!(:sensor_87) { create :sensor, name: 'Sensor 87', user: user2, is_public: false, created_at: 87.seconds.ago }
  let!(:sensor_88) { create :sensor, name: 'Sensor 88', user: user2, is_public: false, created_at: 88.seconds.ago }
  let!(:sensor_89) { create :sensor, name: 'Sensor 89', user: user2, is_public: false, created_at: 89.seconds.ago }
  let!(:sensor_90) { create :sensor, name: 'Sensor 90', user: user2, is_public: false, created_at: 90.seconds.ago }
  let!(:sensor_91) { create :sensor, name: 'Sensor 91', user: user2, is_public: true, created_at: 91.seconds.ago }
  let!(:sensor_92) { create :sensor, name: 'Sensor 92', user: user2, is_public: true, created_at: 92.seconds.ago }
  let!(:sensor_93) { create :sensor, name: 'Sensor 93', user: user2, is_public: true, created_at: 93.seconds.ago }
  let!(:sensor_94) { create :sensor, name: 'Sensor 94', user: user2, is_public: true, created_at: 94.seconds.ago }
  let!(:sensor_95) { create :sensor, name: 'Sensor 95', user: user2, is_public: true, created_at: 95.seconds.ago }
  let!(:sensor_96) { create :sensor, name: 'Sensor 96', user: user2, is_public: true, created_at: 96.seconds.ago }
  let!(:sensor_97) { create :sensor, name: 'Sensor 97', user: user2, is_public: true, created_at: 97.seconds.ago }
  let!(:sensor_98) { create :sensor, name: 'Sensor 98', user: user2, is_public: true, created_at: 98.seconds.ago }
  let!(:sensor_99) { create :sensor, name: 'Sensor 99', user: user2, is_public: true, created_at: 99.seconds.ago }
  let!(:sensor_100) { create :sensor, name: 'Sensor 100', user: user2, is_public: true, created_at: 100.seconds.ago }
  let!(:sensor_101) { create :sensor, name: 'Sensor 101', user: user2, is_public: true, created_at: 101.seconds.ago }
  let!(:sensor_102) { create :sensor, name: 'Sensor 102', user: user2, is_public: true, created_at: 102.seconds.ago }
  let!(:sensor_103) { create :sensor, name: 'Sensor 103', user: user2, is_public: true, created_at: 103.seconds.ago }
  let!(:sensor_104) { create :sensor, name: 'Sensor 104', user: user2, is_public: true, created_at: 104.seconds.ago }
  let!(:sensor_105) { create :sensor, name: 'Sensor 105', user: user2, is_public: true, created_at: 105.seconds.ago }
  let!(:sensor_106) { create :sensor, name: 'Sensor 106', user: user2, is_public: true, created_at: 106.seconds.ago }
  let!(:sensor_107) { create :sensor, name: 'Sensor 107', user: user2, is_public: true, created_at: 107.seconds.ago }
  let!(:sensor_108) { create :sensor, name: 'Sensor 108', user: user2, is_public: true, created_at: 108.seconds.ago }
  let!(:sensor_109) { create :sensor, name: 'Sensor 109', user: user2, is_public: true, created_at: 109.seconds.ago }
  let!(:sensor_110) { create :sensor, name: 'Sensor 110', user: user2, is_public: true, created_at: 110.seconds.ago }
  let!(:sensor_111) { create :sensor, name: 'Sensor 111', user: user2, is_public: true, created_at: 111.seconds.ago }
  let!(:sensor_112) { create :sensor, name: 'Sensor 112', user: user2, is_public: true, created_at: 112.seconds.ago }
  let!(:sensor_113) { create :sensor, name: 'Sensor 113', user: user2, is_public: true, created_at: 113.seconds.ago }
  let!(:sensor_114) { create :sensor, name: 'Sensor 114', user: user2, is_public: true, created_at: 114.seconds.ago }
  let!(:sensor_115) { create :sensor, name: 'Sensor 115', user: user2, is_public: true, created_at: 115.seconds.ago }
  let!(:sensor_116) { create :sensor, name: 'Sensor 116', user: user2, is_public: true, created_at: 116.seconds.ago }
  let!(:sensor_117) { create :sensor, name: 'Sensor 117', user: user2, is_public: true, created_at: 117.seconds.ago }
  let!(:sensor_118) { create :sensor, name: 'Sensor 118', user: user2, is_public: true, created_at: 118.seconds.ago }
  let!(:sensor_119) { create :sensor, name: 'Sensor 119', user: user2, is_public: true, created_at: 119.seconds.ago }
  let!(:sensor_120) { create :sensor, name: 'Sensor 120', user: user2, is_public: true, created_at: 120.seconds.ago }

  context 'not signed in' do
    context 'page 1' do
      before { visit sensors_path }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 31', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 32', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 33', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 34', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 35', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 36', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 37', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 38', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 39', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 40', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 41', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 42', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 43', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 44', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 45', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 46', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 47', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 48', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 49', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit sensors_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 50', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit sensors_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
    end

    context 'page 1' do
      before { visit sensors_path }

      it 'should display only first 20 public records' do
        expect(page).to have_css 'h5', text: 'Sensor 1', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 2', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 3', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 4', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 5', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 6', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 7', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 8', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 9', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 10', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 11', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 12', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 13', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 14', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 15', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 16', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 17', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 18', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 19', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit sensors_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 21', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 22', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 23', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 24', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 25', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 26', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 27', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 28', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 29', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 30', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 31', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 32', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 33', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 34', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 35', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 36', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 37', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 38', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 39', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit sensors_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 40', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 41', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 42', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 43', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 44', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 45', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 46', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 47', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 48', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 49', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 50', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 4' do
      before { visit sensors_path }
      before { click_on '4', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 5' do
      before { visit sensors_path }
      before { click_on '5', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Sensor 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Sensor 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Sensor 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Sensor 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Sensor 120', exact_text: true # still public but wrong page
      end
    end

  end

end
