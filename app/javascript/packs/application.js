// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

const images = require.context('../images', true)

import $ from 'jquery';
global.jQuery = $;
global.$ = $;

// Note: it used to have smth like pace-js (a progress bar for loading). I removed it (because it's buggy with webpack). But the idea of using it is useful.

require("bootstrap")
import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

import 'simplebar';
import 'simplebar/dist/simplebar.css';

import 'animate.css/animate.css';
import "material-design-iconic-font/dist/css/material-design-iconic-font.css";
import "font-awesome/css/font-awesome.css";
import "simple-line-icons/css/simple-line-icons.css";

import "../src/sidebar/sidebar-menu";
import "../src/sidebar/sidebar-menu.css";

import "../src/general/app-script";
import "../src/general/app-style.css";

Rails.start()
Turbolinks.start()
ActiveStorage.start()
