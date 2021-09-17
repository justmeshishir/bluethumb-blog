// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../stylesheets/application.scss'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.on('load', function () {
    /* Progress bar */
    //Source: https://alligator.io/js/progress-bar-javascript-css-variables/
    var h = document.documentElement,
        b = document.body,
        st = 'scrollTop',
        sh = 'scrollHeight',
        progress = document.querySelector('#progress'),
        scroll;
    var scrollpos = window.scrollY;
    var header = document.getElementById("header");
    var navcontent = document.getElementById("nav-content");

    document.addEventListener('scroll', function () {

        /*Refresh scroll % width*/
        scroll = (h[st] || b[st]) / ((h[sh] || b[sh]) - h.clientHeight) * 100;
        progress.style.setProperty('--scroll', scroll + '%');

        /*Apply classes for slide in bar*/
        scrollpos = window.scrollY;

        if (scrollpos > 10) {
            header.classList.add("bg-white");
            header.classList.add("shadow");
            navcontent.classList.remove("bg-gray-100");
            navcontent.classList.add("bg-white");
        } else {
            header.classList.remove("bg-white");
            header.classList.remove("shadow");
            navcontent.classList.remove("bg-white");
            navcontent.classList.add("bg-gray-100");

        }

    });


    //Javascript to toggle the menu
    document.getElementById('nav-toggle').onclick = function () {
        document.getElementById("nav-content").classList.toggle("hidden");
    }
});