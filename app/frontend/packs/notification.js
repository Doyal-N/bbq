document.addEventListener('DOMContentLoaded', function() {
  let close = document.querySelector('#close_notification')
    if(!close) {
      return
    } else {
      close.addEventListener('click', (e) => {
        e.preventDefault()
        document.querySelector('#error_explanation').style.display = 'none';
      })
    }
})
