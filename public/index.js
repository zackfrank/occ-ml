/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      inputText: null,
      text: null,
      fields: null,
      solutionId: null,
      values: []
    };
  },
  created: function() {},
  methods: {
    createMadLib: function() {
      this.createMadLibFeedback();
      let params = {
        text: this.text
      };
      if (this.text) {
        axios.post("v1/mad_libs", params).then(function(response) {
          this.fields = response.data.fields;
          this.solutionId = response.data.solution_id;
        }.bind(this));
      }
    },
    createMadLibFeedback: function() {
      let errorMsg = "PLEASE ENTER YOUR MAD LIB HERE";
      let createdMsg = "New Mad Lib created";
      let alreadyMsg = "Mad Lib already created.";
      if (
        this.inputText && 
        this.inputText !== errorMsg && 
        this.inputText !== createdMsg &&
        this.inputText !== alreadyMsg
      ) {
        this.text = this.inputText;
        this.inputText = createdMsg;
      } else if (
        this.inputText === createdMsg ||
        this.inputText === alreadyMsg
      ) {
        this.inputText = alreadyMsg;
      } else {
        this.inputText = errorMsg;
      }
    },
    fillIn: function() {

    }
  },
  computed: {}
};

var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});