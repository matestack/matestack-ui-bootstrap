import * as bootstrap from 'bootstrap'
import Vue from 'vue/dist/vue.esm'

import MatestackUiCore from 'matestack-ui-core'

Vue.component('matestack-ui-bootstrap-sidebar', {
  mixins: [MatestackUiCore.componentMixin],

  data() {
    return {
      sidebarOpen: false,
    };
  },

  methods: {
    sidebarToggle: function() {
      var sidebarElement = document.getElementById("sidebar");
      if (sidebarElement.classList.contains("closed")) {
        this.openSideBar();
      } else {
        this.closeSideBar();
      }
    },
    openSideBar: function(){
      var sidebarElement = document.getElementById("sidebar");
      var contentElement = document.getElementById("content")
      this.sidebarOpen = true;
      sidebarElement.classList.remove("closed")
      sidebarElement.classList.add("open")
      contentElement.classList.add("sidebar-open")
    },
    closeSideBar: function(){
      var sidebarElement = document.getElementById("sidebar");
      var contentElement = document.getElementById("content")
      this.sidebarOpen = false;
      sidebarElement.classList.add("closed")
      sidebarElement.classList.remove("open")
      contentElement.classList.remove("sidebar-open")
    },
    resizeCallback: function(){
      if (window.innerWidth <= 992){
        this.closeSideBar();
      } else {
        this.openSideBar();
      }
    }
  },

  mounted: function(){
    if (window.innerWidth <= 992){
      this.sidebarOpen = true;
    }
    window.addEventListener('resize', this.resizeCallback);
    var self = this;
    MatestackUiCore.matestackEventHub.$on("page_loaded", function(){
      if (window.innerWidth <= 992){
        self.closeSideBar();
      }
    })
    MatestackUiCore.matestackEventHub.$on("page_loading_triggered", function(){
      if (window.innerWidth <= 992){
        self.closeSideBar();
      }
    })
  }

});
