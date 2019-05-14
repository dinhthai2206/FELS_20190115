$(document).on("turbolinks:load", function () {
  new Vue({
    el: "#categories-index",
    data: {
      categories: null,
    },
    mounted: function() {
      axios
        .get('/api/categories.json')
        .then(function(response) {
          this.categories = response.data;
        });
    }
  });
});
