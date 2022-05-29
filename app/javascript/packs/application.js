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
        require("../src/durationpicker/setup")
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


// Pass single element
const Choices = require('choices.js')
import "choices.js/src/styles/choices.scss";
import "../src/choices/choices.scss";

document.addEventListener("turbolinks:load", function() {
    console.log('adding choices')
    $('select').each(function(i, element) {
        var elementId = $(element).prop('id');

        console.log('adding choices for element: ' + elementId)

        if (element) {
            // Passing options (with default options)
            const choices = new Choices(element, {
                silent: false,
                items: [],
                choices: [],
                renderChoiceLimit: -1,
                maxItemCount: -1,
                addItems: true,
                addItemFilter: null,
                removeItems: true,
                removeItemButton: false,
                editItems: false,
                allowHTML: true,
                duplicateItemsAllowed: true,
                delimiter: ',',
                paste: true,
                searchEnabled: true,
                searchChoices: true,
                searchFloor: 1,
                searchResultLimit: 4,
                searchFields: ['label', 'value'],
                position: 'auto',
                resetScrollPosition: true,
                shouldSort: true,
                shouldSortItems: false,
                // sorter: () => {...},
                placeholder: true,
                placeholderValue: null,
                searchPlaceholderValue: null,
                prependValue: null,
                appendValue: null,
                renderSelectedChoices: 'auto',
                loadingText: 'Loading...',
                noResultsText: 'No results found',
                noChoicesText: 'No choices to choose from',
                itemSelectText: 'Press to select',
                addItemText: (value) => {
                    return `Press Enter to add <b>"${value}"</b>`;
                },
                maxItemText: (maxItemCount) => {
                    return `Only ${maxItemCount} values can be added`;
                },
                valueComparer: (value1, value2) => {
                    return value1 === value2;
                },
                classNames: {
                    containerOuter: 'choices',
                    containerInner: 'choices__inner',
                    input: 'choices__input',
                    inputCloned: 'choices__input--cloned',
                    list: 'choices__list',
                    listItems: 'choices__list--multiple',
                    listSingle: 'choices__list--single',
                    listDropdown: 'choices__list--dropdown',
                    item: 'choices__item',
                    itemSelectable: 'choices__item--selectable',
                    itemDisabled: 'choices__item--disabled',
                    itemChoice: 'choices__item--choice',
                    placeholder: 'choices__placeholder',
                    group: 'choices__group',
                    groupHeading: 'choices__heading',
                    button: 'choices__button',
                    activeState: 'is-active',
                    focusState: 'is-focused',
                    openState: 'is-open',
                    disabledState: 'is-disabled',
                    highlightedState: 'is-highlighted',
                    selectedState: 'is-selected',
                    flippedState: 'is-flipped',
                    loadingState: 'is-loading',
                    noResults: 'has-no-results',
                    noChoices: 'has-no-choices'
                },
                // Choices uses the great Fuse library for searching. You
                // can find more options here: https://fusejs.io/api/options.html
                fuseOptions: {
                    includeScore: true
                },
                labelId: '',
                callbackOnInit: null,
                callbackOnCreateTemplates: null
            });
        }
    });
})

