require 'rails_helper'

RSpec.feature "Index Connection Types Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user }

  let!(:connection_type_1) { create :connection_type, name: 'Connection Type 1', user: user, is_public: false }
  let!(:connection_type_2) { create :connection_type, name: 'Connection Type 2', user: user, is_public: false }
  let!(:connection_type_3) { create :connection_type, name: 'Connection Type 3', user: user, is_public: false }
  let!(:connection_type_4) { create :connection_type, name: 'Connection Type 4', user: user, is_public: false }
  let!(:connection_type_5) { create :connection_type, name: 'Connection Type 5', user: user, is_public: false }
  let!(:connection_type_6) { create :connection_type, name: 'Connection Type 6', user: user, is_public: false }
  let!(:connection_type_7) { create :connection_type, name: 'Connection Type 7', user: user, is_public: false }
  let!(:connection_type_8) { create :connection_type, name: 'Connection Type 8', user: user, is_public: false }
  let!(:connection_type_9) { create :connection_type, name: 'Connection Type 9', user: user, is_public: false }
  let!(:connection_type_10) { create :connection_type, name: 'Connection Type 10', user: user, is_public: false }
  let!(:connection_type_11) { create :connection_type, name: 'Connection Type 11', user: user, is_public: false }
  let!(:connection_type_12) { create :connection_type, name: 'Connection Type 12', user: user, is_public: false }
  let!(:connection_type_13) { create :connection_type, name: 'Connection Type 13', user: user, is_public: false }
  let!(:connection_type_14) { create :connection_type, name: 'Connection Type 14', user: user, is_public: false }
  let!(:connection_type_15) { create :connection_type, name: 'Connection Type 15', user: user, is_public: false }
  let!(:connection_type_16) { create :connection_type, name: 'Connection Type 16', user: user, is_public: false }
  let!(:connection_type_17) { create :connection_type, name: 'Connection Type 17', user: user, is_public: false }
  let!(:connection_type_18) { create :connection_type, name: 'Connection Type 18', user: user, is_public: false }
  let!(:connection_type_19) { create :connection_type, name: 'Connection Type 19', user: user, is_public: false }
  let!(:connection_type_20) { create :connection_type, name: 'Connection Type 20', user: user, is_public: false }
  let!(:connection_type_21) { create :connection_type, name: 'Connection Type 21', user: user, is_public: false }
  let!(:connection_type_22) { create :connection_type, name: 'Connection Type 22', user: user, is_public: false }
  let!(:connection_type_23) { create :connection_type, name: 'Connection Type 23', user: user, is_public: false }
  let!(:connection_type_24) { create :connection_type, name: 'Connection Type 24', user: user, is_public: false }
  let!(:connection_type_25) { create :connection_type, name: 'Connection Type 25', user: user, is_public: false }
  let!(:connection_type_26) { create :connection_type, name: 'Connection Type 26', user: user, is_public: false }
  let!(:connection_type_27) { create :connection_type, name: 'Connection Type 27', user: user, is_public: false }
  let!(:connection_type_28) { create :connection_type, name: 'Connection Type 28', user: user, is_public: false }
  let!(:connection_type_29) { create :connection_type, name: 'Connection Type 29', user: user, is_public: false }
  let!(:connection_type_30) { create :connection_type, name: 'Connection Type 30', user: user, is_public: false }
  let!(:connection_type_31) { create :connection_type, name: 'Connection Type 31', user: user, is_public: true }
  let!(:connection_type_32) { create :connection_type, name: 'Connection Type 32', user: user, is_public: true }
  let!(:connection_type_33) { create :connection_type, name: 'Connection Type 33', user: user, is_public: true }
  let!(:connection_type_34) { create :connection_type, name: 'Connection Type 34', user: user, is_public: true }
  let!(:connection_type_35) { create :connection_type, name: 'Connection Type 35', user: user, is_public: true }
  let!(:connection_type_36) { create :connection_type, name: 'Connection Type 36', user: user, is_public: true }
  let!(:connection_type_37) { create :connection_type, name: 'Connection Type 37', user: user, is_public: true }
  let!(:connection_type_38) { create :connection_type, name: 'Connection Type 38', user: user, is_public: true }
  let!(:connection_type_39) { create :connection_type, name: 'Connection Type 39', user: user, is_public: true }
  let!(:connection_type_40) { create :connection_type, name: 'Connection Type 40', user: user, is_public: true }
  let!(:connection_type_41) { create :connection_type, name: 'Connection Type 41', user: user, is_public: true }
  let!(:connection_type_42) { create :connection_type, name: 'Connection Type 42', user: user, is_public: true }
  let!(:connection_type_43) { create :connection_type, name: 'Connection Type 43', user: user, is_public: true }
  let!(:connection_type_44) { create :connection_type, name: 'Connection Type 44', user: user, is_public: true }
  let!(:connection_type_45) { create :connection_type, name: 'Connection Type 45', user: user, is_public: true }
  let!(:connection_type_46) { create :connection_type, name: 'Connection Type 46', user: user, is_public: true }
  let!(:connection_type_47) { create :connection_type, name: 'Connection Type 47', user: user, is_public: true }
  let!(:connection_type_48) { create :connection_type, name: 'Connection Type 48', user: user, is_public: true }
  let!(:connection_type_49) { create :connection_type, name: 'Connection Type 49', user: user, is_public: true }
  let!(:connection_type_50) { create :connection_type, name: 'Connection Type 50', user: user, is_public: true }
  let!(:connection_type_51) { create :connection_type, name: 'Connection Type 51', user: user, is_public: true }
  let!(:connection_type_52) { create :connection_type, name: 'Connection Type 52', user: user, is_public: true }
  let!(:connection_type_53) { create :connection_type, name: 'Connection Type 53', user: user, is_public: true }
  let!(:connection_type_54) { create :connection_type, name: 'Connection Type 54', user: user, is_public: true }
  let!(:connection_type_55) { create :connection_type, name: 'Connection Type 55', user: user, is_public: true }
  let!(:connection_type_56) { create :connection_type, name: 'Connection Type 56', user: user, is_public: true }
  let!(:connection_type_57) { create :connection_type, name: 'Connection Type 57', user: user, is_public: true }
  let!(:connection_type_58) { create :connection_type, name: 'Connection Type 58', user: user, is_public: true }
  let!(:connection_type_59) { create :connection_type, name: 'Connection Type 59', user: user, is_public: true }
  let!(:connection_type_60) { create :connection_type, name: 'Connection Type 60', user: user, is_public: true }
  let!(:connection_type_61) { create :connection_type, name: 'Connection Type 61', user: user2, is_public: false }
  let!(:connection_type_62) { create :connection_type, name: 'Connection Type 62', user: user2, is_public: false }
  let!(:connection_type_63) { create :connection_type, name: 'Connection Type 63', user: user2, is_public: false }
  let!(:connection_type_64) { create :connection_type, name: 'Connection Type 64', user: user2, is_public: false }
  let!(:connection_type_65) { create :connection_type, name: 'Connection Type 65', user: user2, is_public: false }
  let!(:connection_type_66) { create :connection_type, name: 'Connection Type 66', user: user2, is_public: false }
  let!(:connection_type_67) { create :connection_type, name: 'Connection Type 67', user: user2, is_public: false }
  let!(:connection_type_68) { create :connection_type, name: 'Connection Type 68', user: user2, is_public: false }
  let!(:connection_type_69) { create :connection_type, name: 'Connection Type 69', user: user2, is_public: false }
  let!(:connection_type_70) { create :connection_type, name: 'Connection Type 70', user: user2, is_public: false }
  let!(:connection_type_71) { create :connection_type, name: 'Connection Type 71', user: user2, is_public: false }
  let!(:connection_type_72) { create :connection_type, name: 'Connection Type 72', user: user2, is_public: false }
  let!(:connection_type_73) { create :connection_type, name: 'Connection Type 73', user: user2, is_public: false }
  let!(:connection_type_74) { create :connection_type, name: 'Connection Type 74', user: user2, is_public: false }
  let!(:connection_type_75) { create :connection_type, name: 'Connection Type 75', user: user2, is_public: false }
  let!(:connection_type_76) { create :connection_type, name: 'Connection Type 76', user: user2, is_public: false }
  let!(:connection_type_77) { create :connection_type, name: 'Connection Type 77', user: user2, is_public: false }
  let!(:connection_type_78) { create :connection_type, name: 'Connection Type 78', user: user2, is_public: false }
  let!(:connection_type_79) { create :connection_type, name: 'Connection Type 79', user: user2, is_public: false }
  let!(:connection_type_80) { create :connection_type, name: 'Connection Type 80', user: user2, is_public: false }
  let!(:connection_type_81) { create :connection_type, name: 'Connection Type 81', user: user2, is_public: false }
  let!(:connection_type_82) { create :connection_type, name: 'Connection Type 82', user: user2, is_public: false }
  let!(:connection_type_83) { create :connection_type, name: 'Connection Type 83', user: user2, is_public: false }
  let!(:connection_type_84) { create :connection_type, name: 'Connection Type 84', user: user2, is_public: false }
  let!(:connection_type_85) { create :connection_type, name: 'Connection Type 85', user: user2, is_public: false }
  let!(:connection_type_86) { create :connection_type, name: 'Connection Type 86', user: user2, is_public: false }
  let!(:connection_type_87) { create :connection_type, name: 'Connection Type 87', user: user2, is_public: false }
  let!(:connection_type_88) { create :connection_type, name: 'Connection Type 88', user: user2, is_public: false }
  let!(:connection_type_89) { create :connection_type, name: 'Connection Type 89', user: user2, is_public: false }
  let!(:connection_type_90) { create :connection_type, name: 'Connection Type 90', user: user2, is_public: false }
  let!(:connection_type_91) { create :connection_type, name: 'Connection Type 91', user: user2, is_public: true }
  let!(:connection_type_92) { create :connection_type, name: 'Connection Type 92', user: user2, is_public: true }
  let!(:connection_type_93) { create :connection_type, name: 'Connection Type 93', user: user2, is_public: true }
  let!(:connection_type_94) { create :connection_type, name: 'Connection Type 94', user: user2, is_public: true }
  let!(:connection_type_95) { create :connection_type, name: 'Connection Type 95', user: user2, is_public: true }
  let!(:connection_type_96) { create :connection_type, name: 'Connection Type 96', user: user2, is_public: true }
  let!(:connection_type_97) { create :connection_type, name: 'Connection Type 97', user: user2, is_public: true }
  let!(:connection_type_98) { create :connection_type, name: 'Connection Type 98', user: user2, is_public: true }
  let!(:connection_type_99) { create :connection_type, name: 'Connection Type 99', user: user2, is_public: true }
  let!(:connection_type_100) { create :connection_type, name: 'Connection Type 100', user: user2, is_public: true }
  let!(:connection_type_101) { create :connection_type, name: 'Connection Type 101', user: user2, is_public: true }
  let!(:connection_type_102) { create :connection_type, name: 'Connection Type 102', user: user2, is_public: true }
  let!(:connection_type_103) { create :connection_type, name: 'Connection Type 103', user: user2, is_public: true }
  let!(:connection_type_104) { create :connection_type, name: 'Connection Type 104', user: user2, is_public: true }
  let!(:connection_type_105) { create :connection_type, name: 'Connection Type 105', user: user2, is_public: true }
  let!(:connection_type_106) { create :connection_type, name: 'Connection Type 106', user: user2, is_public: true }
  let!(:connection_type_107) { create :connection_type, name: 'Connection Type 107', user: user2, is_public: true }
  let!(:connection_type_108) { create :connection_type, name: 'Connection Type 108', user: user2, is_public: true }
  let!(:connection_type_109) { create :connection_type, name: 'Connection Type 109', user: user2, is_public: true }
  let!(:connection_type_110) { create :connection_type, name: 'Connection Type 110', user: user2, is_public: true }
  let!(:connection_type_111) { create :connection_type, name: 'Connection Type 111', user: user2, is_public: true }
  let!(:connection_type_112) { create :connection_type, name: 'Connection Type 112', user: user2, is_public: true }
  let!(:connection_type_113) { create :connection_type, name: 'Connection Type 113', user: user2, is_public: true }
  let!(:connection_type_114) { create :connection_type, name: 'Connection Type 114', user: user2, is_public: true }
  let!(:connection_type_115) { create :connection_type, name: 'Connection Type 115', user: user2, is_public: true }
  let!(:connection_type_116) { create :connection_type, name: 'Connection Type 116', user: user2, is_public: true }
  let!(:connection_type_117) { create :connection_type, name: 'Connection Type 117', user: user2, is_public: true }
  let!(:connection_type_118) { create :connection_type, name: 'Connection Type 118', user: user2, is_public: true }
  let!(:connection_type_119) { create :connection_type, name: 'Connection Type 119', user: user2, is_public: true }
  let!(:connection_type_120) { create :connection_type, name: 'Connection Type 120', user: user2, is_public: true }

  context 'not signed in' do
    context 'page 1' do
      before { visit connection_types_path }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 31', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 32', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 33', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 34', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 35', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 36', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 37', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 38', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 39', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 40', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 41', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 42', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 43', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 44', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 45', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 46', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 47', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 48', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 49', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit connection_types_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 50', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit connection_types_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 31', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 32', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 33', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 34', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 35', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 36', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 37', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 38', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 39', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 40', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 41', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 42', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 43', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 44', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 45', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 46', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 47', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 48', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 49', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 50', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
    end

    context 'page 1' do
      before { visit connection_types_path }

      it 'should display only first 20 public records' do
        expect(page).to have_css 'h5', text: 'Connection Type 1', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 2', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 3', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 4', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 5', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 6', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 7', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 8', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 9', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 10', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 11', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 12', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 13', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 14', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 15', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 16', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 17', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 18', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 19', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 2' do
      before { visit connection_types_path }
      before { click_on '2', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 21', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 22', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 23', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 24', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 25', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 26', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 27', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 28', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 29', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 30', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 31', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 32', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 33', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 34', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 35', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 36', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 37', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 38', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 39', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 3' do
      before { visit connection_types_path }
      before { click_on '3', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 40', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 41', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 42', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 43', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 44', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 45', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 46', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 47', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 48', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 49', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 50', exact_text: true # should see my records
        expect(page).to have_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 4' do
      before { visit connection_types_path }
      before { click_on '4', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

    context 'page 5' do
      before { visit connection_types_path }
      before { click_on '5', exact: true }

      it 'should display only first 20 public records' do
        expect(page).to have_no_css 'h5', text: 'Connection Type 1', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 2', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 3', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 4', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 5', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 6', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 7', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 8', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 9', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 10', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 11', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 12', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 13', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 14', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 15', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 16', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 17', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 18', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 19', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 20', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 21', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 22', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 23', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 24', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 25', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 26', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 27', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 28', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 29', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 30', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 31', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 32', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 33', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 34', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 35', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 36', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 37', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 38', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 39', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 40', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 41', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 42', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 43', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 44', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 45', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 46', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 47', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 48', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 49', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 50', exact_text: true # should see my records
        expect(page).to have_no_css 'h5', text: 'Connection Type 51', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 52', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 53', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 54', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 55', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 56', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 57', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 58', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 59', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 60', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 61', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 62', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 63', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 64', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 65', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 66', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 67', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 68', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 69', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 70', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 71', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 72', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 73', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 74', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 75', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 76', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 77', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 78', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 79', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 80', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 81', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 82', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 83', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 84', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 85', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 86', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 87', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 88', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 89', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 90', exact_text: true
        expect(page).to have_no_css 'h5', text: 'Connection Type 91', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 92', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 93', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 94', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 95', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 96', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 97', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 98', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 99', exact_text: true  # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 100', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 101', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 102', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 103', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 104', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 105', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 106', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 107', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 108', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 109', exact_text: true # still public but wrong page
        expect(page).to have_no_css 'h5', text: 'Connection Type 110', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 111', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 112', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 113', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 114', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 115', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 116', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 117', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 118', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 119', exact_text: true # still public but wrong page
        expect(page).to have_css 'h5', text: 'Connection Type 120', exact_text: true # still public but wrong page
      end
    end

  end

end
