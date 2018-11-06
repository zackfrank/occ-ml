/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      inputText: null,
      text: null,
      fields: null,
      solutionId: null,
      values: {},
      solution: null
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
      let params = {
        values: this.values,
        fields: this.fields,
        solution_id: this.solutionId
      };
      axios.patch('/v1/fields', params).then(function(response) {
        axios.get('/v1/solutions/' + this.solutionId, {params: params}).then(function(response) {
          this.solution = response.data;
        }.bind(this));
      }.bind(this));
    }
  },
  computed: {}
};

var ReportsPage = {
  template: "#reports-page",
  data: function() {
    return {
      thing: null
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/reporting", component: ReportsPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});