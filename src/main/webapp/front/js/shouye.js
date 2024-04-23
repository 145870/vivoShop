  let slideIndex = 1;
  showSlides(); // 在页面加载完成后立即调用 showSlides 函数
  
  function showSlides(n) {
    let slides = document.getElementsByClassName("slide");
    let dots = document.getElementsByClassName("dot");
  
    if (n > slides.length) {
      slideIndex = 1;
    }
    if (n < 1) {
      slideIndex = slides.length;
    }
  
    for (let i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
      dots[i].classList.remove("active");
    }
  
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].classList.add("active");
  }
  
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }
  
  function currentSlide(n) {
    showSlides(slideIndex = n);
  }
  
  // 添加定时器实现自动轮播
  let timer = setInterval(function() {
    plusSlides(1);
  }, 4000); // 间隔时间为 5 秒（5000 毫秒）