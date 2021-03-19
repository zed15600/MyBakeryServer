$("#product").on("change", function() {
  param = this.value ? `?product_id=${this.value}` : ""
  window.location.href = `/payments/${param}`
});
