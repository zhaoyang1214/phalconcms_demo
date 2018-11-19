function overflowHidden (el, length){
  if (el.html().length > length) {
    el.html(el.html().substring(0, length-1) + '...')
  }
}