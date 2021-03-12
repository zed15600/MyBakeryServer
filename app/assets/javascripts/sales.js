// #index

$("#vendor").change(function() {
  window.location.href = `/sales?vendor_id=${this.value}`;
});

// #new

$("span#add").click(function() {
  tr = $("tr.product").last();
  clone = tr.clone();
  childs = clone.children();
  sel = $(childs[1]).children().first();
  sel.prop("id", "prod" + cloneCount);
  sel.attr("onchange", "update_value(" + cloneCount + ");");
  quan = $(childs[2]).children().first();
  quan.prop("id", "quan" + cloneCount);
  quan.attr("onchange", "update_value(" + cloneCount + ");");
  childs[3].children[0].id = "total" + cloneCount;
  tr.after(clone);
  cloneCount++;
});

$("span#del").click(() => {
  $("tr.product").last().remove();
  cloneCount--;
});

// #edit

$("div#product_pay").click(function() {
  if (this.style.backgroundColor == "rgb(255, 0, 0)") {
    $.post(`/sale_products/${$(this.parentElement).siblings()[0].value}/pay`, function(data) {
      window.location.reload();
    });
  }
});

function update_value(i) {
  prod_id = parseInt($("#prod" + i).prop("value"))
  quantity = parseInt($("#quan" + i).prop("value"))
  $("#total" + i).prop("value", productsPrices[prod_id - 1] * quantity)
  update_total()
}

function update_total() {
  total = 0
  fields = $("[id*='total']")
  fields = fields.slice(2, fields.length)
  fields.each(function(index, item) {
    total += parseInt(item.value)
  })
  $("#total_v").prop("value", total)
  $("#sale_total_value").prop("value", total)
}

