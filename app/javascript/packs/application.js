// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//=require jquery
//=require jquery_ujs
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import { toggleSwitch } from '../components/toggle';

import { showComments } from '../components/hidden_comments';

import { initMapbox } from '../plugins/init_mapbox';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { initPhotoInput } from '../components/photo_input';
import { flatPick} from "../plugins/flatpickr";

import { addTag } from '../components/add_tag';

import { showDescription } from '../components/hidden_description'


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  toggleSwitch();
  showComments();
  initPhotoInput();
  flatPick();
  addTag();
  showDescription();
})

import "controllers"

import swal from 'sweetalert';

