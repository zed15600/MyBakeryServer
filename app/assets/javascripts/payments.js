$("input[type='checkbox']#show_all").on("click", function() {
  window.location.href = `/payments/?show_all=${this.checked}`
});

